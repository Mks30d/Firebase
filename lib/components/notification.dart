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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification Page"),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () async {
                GetServerKey getServerKey = GetServerKey();
                String accessToken = await getServerKey.getServerKeyToken();
                print("accessToken: $accessToken");
              },
              child: Text("Button"))
        ],
      ),
    );
  }
}
