
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {

  final postController = TextEditingController();
  // final databaseRef = FirebaseDatabase.instance.ref("Post");
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add post"),
        backgroundColor: Colors.teal,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddPostScreen(),
              ));
        },
        child: Icon(Icons.add),
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
            // databaseRef.child("2").set({
            //   "id":2
            // });
          }, child: Text("Button"))
        ],
      ),
    );
  }
}
