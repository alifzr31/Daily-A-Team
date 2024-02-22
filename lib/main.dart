import 'dart:async';
import 'dart:io';

import 'package:dailyateam/app/core/utils/firebase_notif.dart';
import 'package:dailyateam/app/core/utils/firebase_options.dart';
import 'package:dailyateam/app/core/utils/http_overrides.dart';
import 'package:dailyateam/app/core/utils/local_notif.dart';
import 'package:dailyateam/app/core/values/colors.dart';
import 'package:dailyateam/app/routes/pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final LocalNotif localNotif = LocalNotif();

  String title = message.notification!.title.toString().toLowerCase();
  bool payloadAnnouncement = title.contains('announcement');

  localNotif.showNotifications(
    id: message.notification.hashCode,
    title: message.notification?.title,
    body: message.notification?.body,
    payload: payloadAnnouncement.toString(),
  );
}

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  HttpOverrides.global = MyHttpOverrides();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseNotif firebaseNotif = FirebaseNotif();
  LocalNotif localNotif = LocalNotif();

  await localNotif.init();
  await localNotif.requestIOSPermissions();
  firebaseNotif.firebaseInit();
  await firebaseNotif.requestNotificationPermission();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ),
  );

  Timer(const Duration(milliseconds: 500), () => FlutterNativeSplash.remove());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Daily A-Team',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF9FAFF),
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(
          seedColor: navyColor,
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      smartManagement: SmartManagement.full,
      defaultTransition: Transition.cupertino,
      initialRoute: '/',
      getPages: AppPages.pages,
    );
  }
}
