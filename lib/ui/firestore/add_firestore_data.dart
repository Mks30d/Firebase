
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class AddFirestoreData extends StatefulWidget {
  const AddFirestoreData({super.key});

  @override
  State<AddFirestoreData> createState() => _AddFirestoreDataState();
}

class _AddFirestoreDataState extends State<AddFirestoreData> {

  final textController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add firestore data"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              maxLines: 2,
              controller: textController,
              decoration: InputDecoration(
                hintText: "Enter...",
              ),
            ),

            ElevatedButton(onPressed: () {
              setState(() {
                isLoading = true;
              });
            }, child: Text("Add"))
          ],
        ),
      ),
    );
  }
}
