
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class AddPostScreenRealtimeDB extends StatefulWidget {
  const AddPostScreenRealtimeDB({super.key});

  @override
  State<AddPostScreenRealtimeDB> createState() => _AddPostScreenRealtimeDBState();
}

class _AddPostScreenRealtimeDBState extends State<AddPostScreenRealtimeDB> {

  final postController = TextEditingController();
  final databaseRef = FirebaseDatabase.instance.ref("Post");
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add post"),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          TextField(
            controller: postController,
            decoration: InputDecoration(
              hintText: "Enter...",
            ),
          ),
          
          ElevatedButton(onPressed: () {
            databaseRef.child("2").set({
              "id":2
            });
          }, child: Text("Button"))
        ],
      ),
    );
  }
}
