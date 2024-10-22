import 'dart:async';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:movies_buzz/services/theme.dart';
import 'package:movies_buzz/views/base/dialogs/no_internet.dart';
import 'package:movies_buzz/views/screens/splash_screen.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

import 'services/init.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Init().initialize();
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<ScaffoldMessengerState> snackBarKey =
    GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  //
  initPlatForm() {
    OneSignal.initialize("App ID"); //---------------------ADD ONESIGNAL APPID
    // OneSignal.Notifications.requestPermission(true);
    Permission.notification.request();
  }

  late StreamSubscription<List<ConnectivityResult>> subscription;

  bool isConnected = true;
  bool isUpdateVisible = false;

  //
  checkConnection() async {
    // Check initial connectivity status (WiFi, Mobile, etc.)
    final initialStatus = await Connectivity().checkConnectivity();

    // Check actual internet connection status
    isConnected = await InternetConnectionChecker().hasConnection;

    if (mounted) {
      setState(() {});
    }

    // Listen for connectivity changes (WiFi, Mobile, None)
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> result) async {
      // Whenever connectivity changes, check internet access again
      isConnected = await InternetConnectionChecker().hasConnection;

      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    subscription.cancel();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    log('Current state = $state');
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);

    Timer.run(() async {
      await initPlatForm();
      await checkConnection();
    });
  }

  //
  @override
  Widget build(BuildContext context) {
    final Brightness brightness = MediaQuery.of(context).platformBrightness;
    final ThemeData theme =
        brightness == Brightness.dark ? CustomTheme.light : CustomTheme.light;
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'Movie Buzz',
        themeMode: ThemeMode.system,
        theme: theme,
        home: const SplashScreen(),
        builder: (context, child) {
          var data = MediaQuery.of(context);
          return MediaQuery(
            data: data.copyWith(textScaler: const TextScaler.linear(1.0)),
            child: Stack(
              children: [
                child!,
                //? check internet connection ----:)
                if (!isConnected) const NoInternet(),
              ],
            ),
          );
        },
      ),
    );
  }
}
