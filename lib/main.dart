// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:app/helpers/colors.dart';
import 'package:app/helpers/injection.dart';
import 'package:app/helpers/language_constants.dart';
import 'package:app/helpers/parameters.dart';
import 'package:app/helpers/povider_helper/toggle_provider.dart';
import 'package:app/models/app_language.dart';
import 'package:app/models/app_state.dart';
import 'package:app/models/notification_state.dart';
import 'package:app/providers/app_language_provider.dart';
import 'package:app/providers/app_state_provider.dart';
import 'package:app/providers/bottom_navigation/bottom_navigation_bar_provider.dart';
import 'package:app/providers/drawer/help_provider.dart';
import 'package:app/providers/drawer/info_provider.dart';
import 'package:app/providers/drawer/transaction_limit_provider.dart';
import 'package:app/providers/home_screen/contacts_data_provider.dart';
import 'package:app/providers/drawer/toggle_provider.dart';
import 'package:app/providers/home_screen/home_screen_data_provider.dart';
import 'package:app/providers/home_screen/quick_access_data_provider.dart';
import 'package:app/providers/home_screen/tap_selection_provider.dart';
import 'package:app/providers/other_provider/common_provider.dart';
import 'package:app/providers/other_provider/drop_down_provider.dart';
import 'package:app/providers/other_provider/locale_provider.dart';
import 'package:app/providers/payments/mobile_reload.dart';
import 'package:app/providers/payments/qr_payment_provider.dart';
import 'package:app/providers/transaction/transaction_data_provider.dart';
import 'package:app/services/analytics_service.dart';
import 'package:app/services/fcm_service.dart';
import 'package:app/theme.dart';
import 'package:app/utils/log_util.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:app/helpers/routes.dart' as router;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // EasyLocalization.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  // Setup repository injection
  setupInjection();
  await FcmService().init();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(EasyLocalization(
      saveLocale: false,
      supportedLocales:
          supportedLanguages.map((lang) => lang['locale'] as Locale).toList(),
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      child: MultiProvider(
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

          //* Locale Provider
          ChangeNotifierProvider(create: (_) => LocaleProvider()),

          //* Common Provider
          ChangeNotifierProvider(create: (_) => CommonProvider()),
          ChangeNotifierProvider(create: (_) => DropdownProvider()),

          //! Bottom Naviagtions
          ChangeNotifierProvider(create: (_) => BottomNavProvider()),

          //! Home Screen Providers
          ChangeNotifierProvider(create: (_) => HomeScreenDataProvider()),
          ChangeNotifierProvider(create: (_) => QuickAccessProvider()),
          ChangeNotifierProvider(create: (_) => TabSelectionProvider()),
          ChangeNotifierProvider(create: (_) => ContactsProvider()),

          //! Drawer
          ChangeNotifierProvider(create: (_) => ToggleSwitchProvider()),
          ChangeNotifierProvider(create: (_) => DrawerHelpDataProvider()),
          ChangeNotifierProvider(create: (_) => DrawerInfoProvider()),
          ChangeNotifierProvider(create: (_) => TransactionLimitProvider()),

          // ChangeNotifierProvider<BottomNavBarIndeXModel>(
          //   create: (context) => BottomNavBarIndeXModel(),
          // ),

          // Transaction

          ChangeNotifierProvider(create: (_) => TransactionDataProvider()),

          // Qr Code
          ChangeNotifierProvider(create: (_) => QrScannerState()),
          ChangeNotifierProvider(create: (_) => TabBarProvider()),
          ChangeNotifierProvider(create: (_) => TabBarProviderCurved()),
        ],
        child: const MyApp(),
      ),
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
    var toggleProvider = getToggleProvider(context);
    bool isDarkTheme = toggleProvider.getSwitchState("switch_darktheme");
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      statusBarColor: isDarkTheme ? Colors.black : AppColors.primaryBlueColor,
    ));
    return MaterialApp(
      title: Environment.appName,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.Router.generateRoute,
      initialRoute: router.ScreenRoutes.toBottomNavigationScreen,
      navigatorKey: navigatorKey,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      navigatorObservers: [
        AnalyticsService().getFirebaseAnalyticsObserver(),
      ],
      builder: (context, child) {
        final scaleFactor = MediaQuery.of(context).textScaleFactor;
        return MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaleFactor: scaleFactor > 1 ? 1.0 : scaleFactor),
          child: child ?? Container(),
        );
      },
      themeMode: toggleProvider.getSwitchState("switch_darktheme")
          ? ThemeMode.dark
          : ThemeMode.light,
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
    );
  }

  void timeOutCallBack() {
    getAppState(context).appTimeout(navigatorKey.currentContext);
  }

  void initTime() {
    printLog("Reset idle Time *****");
    timer?.cancel();
    timer = Timer(
        Duration(seconds: Environment.timeoutPreSeconds), timeOutCallBack);
  }
}
