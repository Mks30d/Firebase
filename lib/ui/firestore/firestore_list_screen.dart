import 'package:firebase/ui/firestore/add_firestore_data.dart';
import 'package:firebase/ui/posts/add_post_screen.dart';
import 'package:flutter/material.dart';

class FirestoreListScreen extends StatefulWidget {
  const FirestoreListScreen({super.key});

  @override
  State<FirestoreListScreen> createState() => _FirestoreListScreenState();
}

class _FirestoreListScreenState extends State<FirestoreListScreen> {
  final postController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FirestoreListScreen"),
        automaticallyImplyLeading: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddFirestoreData(),
              ));
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("data: $index"),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  // ----------------------------------------------
  final editController = TextEditingController();

  Future<void> showMyDailog() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Update"),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel")),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Update"))
          ],
          content: Container(
            child: TextField(
              controller: editController,
              decoration: InputDecoration(
                hintText: "Enter...",
              ),
            ),
          ),
        );
      },
    );
  }
}
