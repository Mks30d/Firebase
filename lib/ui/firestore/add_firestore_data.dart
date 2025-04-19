import 'package:cloud_firestore/cloud_firestore.dart';
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
  final firestore = FirebaseFirestore.instance.collection("users");

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
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    isLoading = true;
                  });
                  String id = DateTime.now().millisecondsSinceEpoch.toString();
                  firestore.doc(id).set({
                    "id": id,
                    "title": textController.text.toString(),
                  }).then(
                    (value) {
                      setState(() {
                        isLoading = false;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Data added successfully"),
                          backgroundColor: Colors.green,
                        ),
                      );
                    },
                  ).onError(
                    (error, stackTrace) {
                      setState(() {
                        isLoading = false;
                      });
                      debugPrint("error:- $error");
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Failed to add: $error"),
                          backgroundColor: Colors.red,
                        ),
                      );
                    },
                  );
                },
                child: isLoading
                    ? Center(child: CircularProgressIndicator())
                    : Text("Add"))
          ],
        ),
      ),
    );
  }
}
