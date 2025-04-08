import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationList extends StatefulWidget {
  final RemoteMessage? message;

  const NotificationList({super.key, this.message});

  @override
  State<NotificationList> createState() => _NotificationListState();
}

class _NotificationListState extends State<NotificationList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification List"),
      ),
      body: Card(
        elevation: 3,
        child: ListTile(
          title: Text(widget.message!.notification!.title.toString()),
          subtitle: Text(widget.message!.notification!.body.toString()),
          trailing: Text(widget.message!.data["screen"].toString()),
        ),
      ),
    );
  }
}
