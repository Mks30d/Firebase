import 'package:firebase_messaging/firebase_messaging.dart';

class FcmService {
  static void firebaseInit() {
    FirebaseMessaging.onMessage.listen((message){
      print(":--- ${message.notification}");
      print("Title:--- ${message.notification!.title}");
      print("Body:--- ${message.notification!.body}");
    });
  }
}