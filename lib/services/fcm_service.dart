import 'dart:convert';
import 'dart:io';

import 'package:app/firebase_options.dart';
import 'package:app/providers/app_state_provider.dart';
import 'package:app/utils/log_util.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:path_provider/path_provider.dart';

// import 'package:rxdart/rxdart.dart';

/// There are 3 states of the app while receiving a notification.
/// 1. App running in foreground.
/// 2. App running in background.
/// 3. App is terminated.
///
/// > IN FOREGROUND
///     i.    Sound available                 ✅
///     ii.   Visible in notification center  ✅
///     iii.  Popup                           ✅
///
/// > IN BACKGROUND
/// When app is in background or terminated, already a notification is shown
/// on the notification center.
/// Handled by `FirebaseMessaging.onBackgroundMessage(...)`
///
/// a) If running in background,
///     i.    Sound available                 ✅
///     ii.   Visible in notification center  ✅
///     iii.  NO popup                        ❌
/// b) If terminated,
///     1.    NO sound alert                  ✅
///     ii.   Visible in notification center  ✅
///     iii.  NO popup                        ❌

final FlutterLocalNotificationsPlugin _localNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

const AndroidNotificationChannel _channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  description:
      'This channel is used for important notifications.', // description
  importance: Importance.high,
  enableLights: true,
);

@pragma('vm:entry-point')
Future<dynamic> _firebaseMessagingBackgroundHandler(
    RemoteMessage message) async {
  printLog(
      'Handling a background message in _firebaseMessagingBackgroundHandler');

  await _localNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(_channel);
  // showNotification(message);
}

@pragma('vm:entry-point')
bg1(details) {
  /// Handle background notifications
  printLog("Background notification ***");
  printLog(details.toString());
}

class FcmService {
  Future<void> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  Future<void> initNotifications(BuildContext context,
      {Function(RemoteMessage)? onNotification}) async {
    FirebaseMessaging fbInstance = FirebaseMessaging.instance;

    /// init
    _requestPermissions(fbInstance);

    /// Config
    fbInstance.subscribeToTopic('all');

    await _localNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(_channel);

    await fbInstance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    const initAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
    final DarwinInitializationSettings initIos = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
      onDidReceiveLocalNotification: (
        int id,
        String? title,
        String? body,
        String? payload,
      ) async {
        printLog("IOS notification handle");
        // didReceiveLocalNotificationSubject.add(
        //   ReceivedNotification(
        //     id: id,
        //     title: title ?? "",
        //     body: body ?? "",
        //     payload: payload ?? "",
        //   ),
        // );
      },
    );

    final initializationSettings = InitializationSettings(
      android: initAndroid,
      iOS: initIos,
    );

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      printLog("Foreground message -> ${message.toMap().toString()}");
      // Received to app

      RemoteNotification? notification = message.notification;
      String? pa = notification?.android?.imageUrl?.isEmpty ?? true
          ? null
          : await _downloadAndSavePicture(notification?.android?.imageUrl,
              DateTime.now().toIso8601String());
      String? smallIcon = notification?.android?.smallIcon?.isEmpty ?? true
          ? null
          : await _downloadAndSavePicture(notification?.android?.smallIcon,
              DateTime.now().toIso8601String());

      printLog("show");

      _localNotificationsPlugin.show(
        notification.hashCode,
        notification?.title,
        notification?.body,
        payload: jsonEncode({"c": "ccc"}),
        NotificationDetails(
          android: AndroidNotificationDetails(
            _channel.id,
            _channel.name,
            channelDescription: _channel.description,
            color: Colors.green,
            styleInformation: (pa != null) && (smallIcon != null)
                ? _buildBigPictureStyleInformation(
                    "title", "body", pa, smallIcon, true)
                : null,
          ),
          iOS: const DarwinNotificationDetails(),
        ),
      );
    });

    /// Interactions
    await _setupInteractedMessage();

    /// Notification Tap - Handle notification at running states
    _localNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveBackgroundNotificationResponse: bg1,
      onDidReceiveNotificationResponse: (details) {
        /// Handle foreground notification tap
        printLog("Foreground notification ***");
        printLog(details.toString());
      },
    );

    String? token = await fbInstance.getToken();
    printLog("FirebaseMessaging token: $token");

    getAppState(context).fcmToken = token;

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  /// Interaction handlers (Terminated, background)
  Future<void> _setupInteractedMessage() async {
    /// Notification Tap - Handle notification tap at terminated state
    ///
    /// Start - Get any messages which caused the application to open from
    /// a terminated state.
    RemoteMessage? message =
        await FirebaseMessaging.instance.getInitialMessage();

    printLog("Initial state message -> ${message?.toMap().toString()}");

    if (message != null) {
      printLog("Initial notification found **");
      printLog("Type -> ${message.data["type"]}");

      // TODO: handle app opened from terminated state message tap
    }

    /// End - Handle notification tap at terminated state

    /// Notification Tap - Handle notification tap while in background
    ///
    /// Also handle any interaction when the app is in the background via a
    /// Stream listener
    FirebaseMessaging.onMessageOpenedApp.listen((message) async {
      printLog('App opened from background');
      printLog('Background message -> ${message.toMap().toString()}');

      // TODO: handle app opened from background message tap
    });
  }

  Future<String?> _downloadAndSavePicture(String? url, String fileName) async {
    if (url == null) return null;
    final Directory directory = await getApplicationDocumentsDirectory();
    final String filePath =
        '${directory.path}/$fileName.${url.split('.').last}';
    // final http.Response response = await http.get(Uri.parse(url));
    final File file = File(filePath);
    // await file.writeAsBytes(response.bodyBytes);
    printLog(filePath);
    return filePath;
  }

  BigPictureStyleInformation? _buildBigPictureStyleInformation(
    String title,
    String body,
    String picturePath,
    String? iconPath,
    bool showBigPicture,
  ) {
    final FilePathAndroidBitmap filePath = FilePathAndroidBitmap(picturePath);
    final FilePathAndroidBitmap? iconFilePath =
        iconPath != null ? FilePathAndroidBitmap(iconPath) : null;
    return BigPictureStyleInformation(
      showBigPicture ? filePath : const FilePathAndroidBitmap("empty"),
      largeIcon: iconFilePath,
      contentTitle: title,
      htmlFormatContentTitle: true,
      summaryText: body,
      htmlFormatSummaryText: true,
    );
  }

  void _requestPermissions(FirebaseMessaging messaging) async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      printLog('User granted notification permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      printLog('User granted notification provisional permission');
    } else {
      printLog('User declined or has not accepted notification permission');
      _requestPermissions(messaging);
    }
  }
}
