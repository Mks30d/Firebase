import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/main.dart';
import 'package:firebase/ui/firestore/add_firestore_data.dart';
import 'package:firebase/ui/posts/add_post_screen.dart';
import 'package:flutter/material.dart';

class FirestoreListScreen extends StatefulWidget {
  const FirestoreListScreen({super.key});

  @override
  State<FirestoreListScreen> createState() => _FirestoreListScreenState();
}

class _FirestoreListScreenState extends State<FirestoreListScreen> {
  final firestore = FirebaseFirestore.instance.collection("users").snapshots();

  CollectionReference ref = FirebaseFirestore.instance.collection("users"); // --OR--
  // final ref = FirebaseFirestore.instance.collection("users");

  final editController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FirestoreListScreen"),
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
          StreamBuilder<QuerySnapshot>(
            stream: firestore,
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting)
                return Center(child: CircularProgressIndicator());

              if (snapshot.hasError) {
                return Center(
                    child: Text("snapshot error!!! ${snapshot.hasError}"));
              }

              return Expanded(
                child: ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(snapshot.data!.docs[index].id.toString()),
                      subtitle: Text(snapshot.data!.docs[index]["title"]),
                      //----------Delete---------
                      leading: IconButton(
                        onPressed: () {
                          // ref.doc(snapshot.data!.docs[index].id).delete();
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Text("Are you sure!"),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("Cancel")),
                                  TextButton(
                                      onPressed: () {
                                        ref
                                            .doc(snapshot.data!.docs[index].id)
                                            .delete();
                                        Navigator.pop(context);
                                      },
                                      child: Text("Delete"))
                                ],
                              );
                            },
                          );
                        },
                        icon: Icon(Icons.delete),
                      ),
                      //----------Edit----------
                      trailing: IconButton(
                        onPressed: () {
                          editController.text = snapshot.data!.docs[index]["title"];
                          String id = snapshot.data!.docs[index].id.toString(); // --OR--
                          // String id = snapshot.data!.docs[index]["id"].toString();

                          showMyDialogBox(
                              editController.text, id, index, snapshot,);

                          //   ref.doc(snapshot.data!.docs[index]["id"]).update({
                          //     "title": "updated: $index",
                          //   }).then(
                          //     (value) {
                          //       customSuccessScaffoldMessage(context);
                          //     },
                          //   ).onError(
                          //     (error, stackTrace) {
                          //       customErrorScaffoldMessage(context, error.toString());
                          //     },
                          //   );
                        },
                        icon: Icon(Icons.edit),
                      ),
                    );
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }

  // ----------------- showMyDialog ------------------
  Future<void> showMyDialogBox(String text, String id, int index,
      AsyncSnapshot<QuerySnapshot> snapshot) {
    editController.text = text;
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Update"),
          content: Container(
            child: TextField(
              controller: editController,
              decoration: InputDecoration(
                hintText: "Enter...",
              ),
            ),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel")),
            TextButton(
                onPressed: () {
                  ref.doc(snapshot.data!.docs[index]["id"]).update({
                    "title": editController.text,
                  }).then(
                    (value) {
                      customSuccessScaffoldMessage(context);
                    },
                  ).onError(
                    (error, stackTrace) {
                      customErrorScaffoldMessage(context, error.toString());
                    },
                  );
                  Navigator.pop(context);
                },
                child: Text("Update"))
          ],
        );
      },
    );
  }
}
