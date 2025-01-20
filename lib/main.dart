import 'dart:async';

import 'package:cbm_one_app/colors.dart';
import 'package:cbm_one_app/models/app_language.dart';
import 'package:cbm_one_app/models/app_state.dart';
import 'package:cbm_one_app/models/notification_state.dart';
import 'package:cbm_one_app/parameters.dart';
import 'package:cbm_one_app/providers/app_language_provider.dart';
import 'package:cbm_one_app/providers/app_state_provider.dart';
import 'package:cbm_one_app/services/analytics_service.dart';
import 'package:cbm_one_app/services/fcm_service.dart';
import 'package:cbm_one_app/utils/log_util.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:cbm_one_app/routes.dart' as r;

import 'injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Setup repository injection
  setupInjection();

  await FcmService().init();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<AppState>(
          create: (context) => AppState(),
        ),
        ChangeNotifierProvider<AppLanguage>(
          create: (context) => AppLanguage(),
        ),
        ChangeNotifierProvider<NotificationState>(
          create: (context) => NotificationState(),
        ),
      ],
      child: const MyApp(),
    ));
  });

  //crashlytics
  //send error throws by flutter
  FlutterError.onError = (errorDetails) {
    if (!kDebugMode) {
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
    }
  };
  //send error throws by platform
  PlatformDispatcher.instance.onError = (error, stack) {
    if (!kDebugMode) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    }
    return true;
  };
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  Timer? timer;

  @override
  void initState() {
    FcmService().initNotifications(context);
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    if (timer != null) {
      timer?.cancel();
    }
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  // This widget is the root of your application.
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // if (state == AppLifecycleState.resumed) {
    //   printLog("App is resume");
    //   try {
    //     printLog(ModalRoute.of(context)!.settings.name);
    //   } catch (e) {
    //     printLog(e);
    //   }

    //   getAppState(context).appTimeout(navigatorKey.currentContext);
    // } else {
    //   getAppState(context).endSession(navigatorKey.currentContext);
    //   printLog(state.toString());
    // }
  }

  @override
  Widget build(BuildContext context) {
    initTime();

    printLog('AppLocale -> ${getAppLang(context).appLocale}');

    return MaterialApp(
      title: Env.appName,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: r.Router.generateRoute,
      initialRoute: r.ScreenRoutes.toSplashScreen,
      navigatorKey: navigatorKey,
      navigatorObservers: [
        // AnalyticsService().getFirebaseAnalyticsObserver(),
      ],
      builder: (context, child) {
        final scaleFactor = MediaQuery.of(context).textScaleFactor;
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
              textScaler:
                  TextScaler.linear(scaleFactor > 1 ? 1.0 : scaleFactor)),
          child: child ?? Container(),
        );
      },
      theme: ThemeData(
        primarySwatch: AppColors.primaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // fontFamily: 'SF-Pro-Display',
      ),
    );
  }

  void timeOutCallBack() {
    getAppState(context).appTimeout(navigatorKey.currentContext);
  }

  void initTime() {
    printLog("Reset idle Time *****");
    timer?.cancel();
    timer = Timer(Duration(seconds: Env.timeoutPreSeconds), timeOutCallBack);
  }
}
