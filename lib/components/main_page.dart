import 'package:firebase/components/login_page.dart';
import 'package:firebase/components/notification_list.dart';
import 'package:firebase/services/fcm_service.dart';
import 'package:firebase/services/get_server_key.dart';
import 'package:firebase/services/notification_service.dart';
import 'package:firebase/services/send_notification_using_api_service.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  NotificationService notificationService = NotificationService();
  final GetServerKey _getServerKey = GetServerKey();

  @override
  void initState() {
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

  //-----------------main--------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Page"),
        backgroundColor: Colors.blue,
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NotificationList(),
                ),
              );
            },
            child: Icon(Icons.notifications),
          ),
        ],
        actionsIconTheme: IconThemeData(size: 40),
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
                  //------ realme device token------------
                  // token:
                  //     "eqnoyYJJTEueouqMrCcmmB:APA91bE79P0IscvF9CEv9ZThYtqncygUOkuMTJfUi14SrBJuukyZhpnpZMQ85BUaA0AVlXeOAkLAmhg-SgqPhVsibMPYCnUlP5r8h12WaOBhEYV-UxGv9TI",

                  //------ samsung device token------------
                  token:
                      "eTcWdLHqQ4aCJt-BXeOojc:APA91bEmf-8D_RZgbYVcAj_nNZCXUbX6nFYWhLLYWlt-m6lRaF92G05VCfG8SdWYjv7nFybqLrBHHsB3CpyseRh2xeSyV0aFGRuVSbAUrsEsWoQBI2XiJRk",
                  title: "-----Noti thought API: title---",
                  body: "Notification body",
                  data: {
                    "screen": "NotificationList",
                  },
                );
              },
              child: const Text("Notification through API"),
            ),


            ElevatedButton(
              onPressed: () async {
                SendNotificationUsingApiService.sendNotificationUsingApi(
                  token: "",
                  title: "all user title",
                  body: "all user body",
                  data: {},
                );
              },
              child: Text("Notification to all through API"),
            ),
          ],
        ),
      ),
    );
  }
}
