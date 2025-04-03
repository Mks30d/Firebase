import 'package:firebase/components/login_page.dart';
import 'package:firebase/services/fcm_service.dart';
import 'package:firebase/services/get_server_key.dart';
import 'package:firebase/services/notification_service.dart';
import 'package:firebase/services/send_notification_using_api_service.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  NotificationService notificationService = NotificationService();
  final GetServerKey _getServerKey = GetServerKey();

  @override
  void initState() {
    // TODO: implement initState
    print("initState:--------");
    super.initState();
    notificationService.requestNotificationPermission();
    notificationService.getDeviceToken();
    getServerToken();
    // _getServerKey.getServerKeyToken();
    FcmService.firebaseInit();
    notificationService.firebseInit(context);
    notificationService.setupInteractMessage(context);
  }

  // https://firebase.google.com/docs/cloud-messaging/migrate-v1?hl=en&authuser=0
  Future<void> getServerToken() async {
    String serverToken = await _getServerKey.getServerKeyToken();
    print("Server Token:------- $serverToken");
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
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                );
              },
              child: Text("Login"),
            ),
            ElevatedButton(
              onPressed: () async {
                await SendNotificationUsingApiService.sendNotificationUsingApi(
                  token:
                      "eqnoyYJJTEueouqMrCcmmB:APA91bE79P0IscvF9CEv9ZThYtqncygUOkuMTJfUi14SrBJuukyZhpnpZMQ85BUaA0AVlXeOAkLAmhg-SgqPhVsibMPYCnUlP5r8h12WaOBhEYV-UxGv9TI",
                  title: "Notification title",
                  body: "Notification body",
                  data: {
                    "screen": "login",
                  },
                );
              },
              child: Text("Hit API"),
            ),
          ],
        ),
      ),
    );
  }
}
