import 'dart:convert';

import 'package:firebase/services/get_server_key.dart';
import 'package:http/http.dart' as http;

class SendNotificationUsingApiService {
  static Future<void> sendNotificationUsingApi({
    required String? token,
    required String? title,
    required String? body,
    required Map<String, dynamic>? data,
  }) async {
    String serverKey = await GetServerKey().getServerKeyToken();
    print("Notification Server key:---- $serverKey");

    // ------------ Links for FCM API integration -------------
    // https://firebase.google.com/docs/cloud-messaging/migrate-v1?hl=en&authuser=0  // documentation
    // https://fcm.googleapis.com/v1/projects/myprojectID/messages:send  // FCM API
    String url =
        "https://fcm.googleapis.com/v1/projects/fir-tutorial-cfc61/messages:send";

    var headers = <String, String>{
      "Content-Type": "application/json",
      "Authorization": "Bearer $serverKey",
    };

    // ---------- api body ----------
    Map<String, dynamic> message = {
      "message": {
        // "token": token, // to send notif to specific user using device token
        "topic" : "all", // to send notif to all user
        "notification": {
          "title": title,
          "body": body,
        },
        "data": data,
      }
    };

    //-------------hit API---------------
    final http.Response response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(message),
    );

    if(response.statusCode == 200) {
      print("---Notification send successfully---");
    } else {
      print("Notification not send!! Error.....");
    }

  }
}
