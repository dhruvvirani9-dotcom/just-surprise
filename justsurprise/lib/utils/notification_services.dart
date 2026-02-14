import 'dart:math';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:justsurprise/utils/shared_preferences_services.dart';
import '../view/screens/home_screen.dart';
import 'GlobalVariable.dart';

class NotificationServices {

  FirebaseMessaging messaging = FirebaseMessaging.instance;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  void requestNotificationPermission() async {
    NotificationSettings settings = await messaging.requestPermission (
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true
    );

    if(settings.authorizationStatus == AuthorizationStatus.authorized) {
      print("user granted permission");
    } else if(settings.authorizationStatus == AuthorizationStatus.provisional) {
      print("user granted provisional permission");
    } else {
      print("user denied permission");
      //AppSettings.openNotificationSettings();
    }
  }

  static void getFCMToken(BuildContext context) async {
    String? firebaseToken = await FirebaseMessaging.instance.getToken();
    print('firebaseToken $firebaseToken');
  }

  static Future<void> isTokenRefresh() async {
    FirebaseMessaging.instance.onTokenRefresh.listen((refreshToken) {
      print("refresh Token ${refreshToken.toString}");
    });
  }

  void firebaseInit(BuildContext context) {
    FirebaseMessaging.instance.getInitialMessage();
    FirebaseMessaging.onMessage.listen((message) {
        print(message.notification!.title.toString());
        print(message.notification!.body.toString());
        print(message.data.toString());
        if (Platform.isAndroid) {
          initLocalNotifications(context, message);
          showNotification(message);
        }
    });
  }

  void initLocalNotifications(BuildContext context,RemoteMessage message) async {
    var androidInitializationSettings = const AndroidInitializationSettings('@mipmap/ic_launcher');
    var iosInitializationSettings = const DarwinInitializationSettings();

    var initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings
    );

    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,onDidReceiveNotificationResponse: (payload) {
          handleMessage(context, message);
      },
    );
  }

  Future<void> showNotification(RemoteMessage message) async {

    AndroidNotificationChannel channel = AndroidNotificationChannel(
        Random.secure().nextInt(100000).toString(), "high_importance_channel",
        importance: Importance.high);

        var bigTextStyleInformation = BigTextStyleInformation(message.notification!.body.toString());

      AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
          channel.id.toString(),
          channel.name.toString(),
          channelDescription: "your channel description",
          importance: Importance.high,
          priority: Priority.high,
          styleInformation: bigTextStyleInformation,
          ticker: "ticker"
      );


      DarwinNotificationDetails darwinNotificationDetails = const DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true
      );

      NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails,
        iOS: darwinNotificationDetails
      );

      Future.delayed(Duration.zero,() {
        flutterLocalNotificationsPlugin.show(
            Random.secure().nextInt(100000),
            message.notification!.title.toString(),
            message.notification!.body.toString(),
            notificationDetails
        );
      });
  }

  Future<void> setupInteractMessage(BuildContext context) async {
    //when app is terminated
     RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();
     if(initialMessage != null) {
        handleMessage(context, initialMessage);
     }

    //when app is InBackground
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      handleMessage(context, event);
    });
  }

  void handleMessage(BuildContext context, RemoteMessage remoteMessage) {
    Navigator.pushReplacement(GlobalVariable.navState.currentContext!, MaterialPageRoute(
      builder: (context) => const HomeScreen(),
    ));
  }
}