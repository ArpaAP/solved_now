import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:solved_now/pages/login.dart';
import 'package:tailwind_colors/tailwind_colors.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Pass all uncaught "fatal" errors from the framework to Crashlytics
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  final remoteConfig = FirebaseRemoteConfig.instance;
  await remoteConfig.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(minutes: 1),
    minimumFetchInterval: const Duration(hours: 1),
  ));

  await remoteConfig.fetchAndActivate();

  FirebaseMessaging.instance.requestPermission(
    badge: true,
    alert: true,
    sound: true,
  );
  final fcmToken = await FirebaseMessaging.instance.getToken();

  print(fcmToken);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: "Pretendard",
          colorScheme: ColorScheme.fromSeed(
            primary: const Color.fromRGBO(33, 201, 45, 1),
            seedColor: const Color.fromRGBO(33, 201, 45, 1),
          ),
          primaryColorLight: const Color.fromRGBO(115, 230, 122, 1),
          useMaterial3: true,
          scaffoldBackgroundColor: const Color.fromRGBO(245, 247, 250, 1),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          cardColor: Colors.grey[100],
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: const Color.fromRGBO(235, 236, 243, 1),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10,
            ),
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            selectedItemColor: TW3Colors.neutral.shade700,
            unselectedItemColor: TW3Colors.neutral.shade400,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            elevation: 0,
          ),
        ),
        darkTheme: ThemeData.dark(useMaterial3: true).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: const Color.fromRGBO(235, 236, 243, 0.03),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10,
            ),
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedItemColor: TW3Colors.neutral.shade300,
            unselectedItemColor: TW3Colors.neutral.shade500,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            elevation: 0,
          ),
        ),
        home: const LoginPage(),
      ),
    );
  }
}
