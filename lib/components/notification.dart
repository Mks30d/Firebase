import 'package:firebase/components/login_page.dart';
import 'package:firebase/services/fcm_service.dart';
import 'package:firebase/services/get_server_key.dart';
import 'package:firebase/services/notification_service.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {

  NotificationService notificationService = NotificationService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notificationService.requestNotificationPermission();
    notificationService.getDeviceToken();
    FcmService.firebaseInit();
    notificationService.firebseInit(context);
    notificationService.setupInteractMessage(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification Page"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  GetServerKey getServerKey = GetServerKey();
                  String accessToken = await getServerKey.getServerKeyToken();
                  print("accessToken: $accessToken");
                },
                child: Text("Button"),
            ),

            ElevatedButton(onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ),
              );
            }, child: Text("Login"),
            )
          ],
        ),
      ),
    );
  }
}
