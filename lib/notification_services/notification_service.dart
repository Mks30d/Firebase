import 'dart:async';
import 'package:app_settings/app_settings.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// import 'package:get/get.dart';
import 'dart:io' show Platform;

import '../ui/notification_list.dart';
import '../ui/signin_page.dart';

class NotificationService {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  //for notification request
  void requestNotificationPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print("authorized granted");
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print("provisional granted");
    } else {
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text(""))
      // );
      print("Permission Denied!!!");

      Future.delayed(
        Duration(seconds: 2),
        () {
          // redirection to app notification setting
          AppSettings.openAppSettings(type: AppSettingsType.notification);
        },
      );
    }
  }

  // get device token, as every device token is different
  Future<String> getDeviceToken() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );

    String? token = await messaging.getToken();
    print("Device Token:-- $token");
    return token!;
  }

  //-------------initialization--------------
  void initLocalNotification(
      BuildContext context, RemoteMessage message) async {

    var androidInitSetting = const AndroidInitializationSettings("@mipmap/ic_launcher");
    var iosInitSetting = const DarwinInitializationSettings();

    var initializationSettings = InitializationSettings(
      android: androidInitSetting,
      iOS: iosInitSetting,
    );

    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (payload) {
        handleMessage(context, message);
      },
    );
  }

//-------------Firebase init (Foreground state)--------------
  void firebseInit(BuildContext context) {
    FirebaseMessaging.onMessage.listen(
      (message) {
        RemoteNotification? notification = message.notification;
        AndroidNotification? android = message.notification!.android;

        if (kDebugMode) {
          print("Notification title:-- ${notification!.title}");
          print("Notification body:-- ${notification.body}");
        }
        if (Platform.isIOS) {
          iosForegroundMessage();
        }
        if (Platform.isAndroid) {
          initLocalNotification(context, message);
          // handleMessage(context, message);
          showNotificationPopup(message);
        }
      },
    );
  }

  //function to show notification popup
  Future<void> showNotificationPopup(RemoteMessage message) async {
    AndroidNotificationChannel channel = AndroidNotificationChannel(
      message.notification!.android!.channelId.toString(),
      message.notification!.android!.channelId.toString(),
      importance: Importance.high,
      showBadge: true,
      playSound: true,
    );

    // android setting
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      channel.id.toString(),
      channel.name.toString(),
      channelDescription: "Channel Description",
      importance: Importance.high,
      priority: Priority.high,
      playSound: true,
      sound: channel.sound,
    );

    // ios setting
    DarwinNotificationDetails darwinNotificationDetails = DarwinNotificationDetails();

    // merge settings
    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails,
    );

    // show notification
    Future.delayed(
      Duration.zero,
      () {
        _flutterLocalNotificationsPlugin.show(
          0,
          message.notification!.title.toString(),
          message.notification!.body.toString(),
          notificationDetails,
          payload: "demo data",
        );
      },
    );
  }

  // for aap is in background or terminated state
  Future<void> setupInteractMessage(BuildContext context) async {
    // background state
    FirebaseMessaging.onMessageOpenedApp.listen(
      (message) {
        handleMessage(context, message);
      },
    );
    // terminated state
    FirebaseMessaging.instance.getInitialMessage().then(
      (RemoteMessage? message) {
        if (message != null && message.data.isNotEmpty) {
          handleMessage(context, message);
        }
      },
    );
  }

  // handle message: what to do when user click notification
  Future<void> handleMessage(
      BuildContext context, RemoteMessage message) async {
    print("Notification Clicked:---");
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => LoginPage(),
    //   ),
    // );

    if (message.data["screen"] == "login") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SigninPage(),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NotificationList(message: message,),
        ),
      );
    }
  }

  // ios message
  Future iosForegroundMessage() async {
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }
}
