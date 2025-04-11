import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddNewTask extends StatefulWidget {
  const AddNewTask({super.key});

  @override
  State<AddNewTask> createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  Color _selectedColor = Colors.blue;

  Future<void> uploadTaskToDb() async {
    try {
      final data = await FirebaseFirestore.instance.collection("tasks").add({
        "title": titleController.text.trim(),
        "description": descriptionController.text.trim(),
        // "date" : DateTime.now() // or better way:
        "date": FieldValue.serverTimestamp()
      });
      print("data.id:-- ${data.id}");
    } catch (e) {
      print("uploadTaskToDb error:-- $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Task'),
        actions: [
          GestureDetector(
            onTap: () {
              // final selDate = await showDatePicker(
              //   context: context,
              //   firstDate: DateTime.now(),
              //   lastDate: DateTime.now().add(
              //     const Duration(days: 90),
              //   ),
              // );
              // if (selDate != null) {
              //   setState(() {
              //     // selectedDate = selDate;
              //   });
              // }
            },
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    // DateFormat('MM-d-y').format(selectedDate),
                    ""),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // GestureDetector(
            //   onTap: () {
            //     // final image = await selectImage();
            //     setState(
            //       () {
            //         // file = image;
            //       },
            //     );
            //   },
            //   // child: DottedBorder(
            //   //   borderType: BorderType.RRect,
            //   //   radius: const Radius.circular(10),
            //   //   dashPattern: const [10, 4],
            //   //   strokeCap: StrokeCap.round,
            //   //   child: Container(
            //   //     width: double.infinity,
            //   //     height: 150,
            //   //     decoration: BoxDecoration(
            //   //       borderRadius: BorderRadius.circular(10),
            //   //     ),
            //   //     child: file != null
            //   //         ? Image.file(file!)
            //   //         : const Center(
            //   //             child: Icon(
            //   //               Icons.camera_alt_outlined,
            //   //               size: 40,
            //   //             ),
            //   //           ),
            //   //   ),
            //   // ),
            // ),
            const SizedBox(height: 10),
            TextFormField(
              controller: titleController,
              decoration: const InputDecoration(
                hintText: 'Title',
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: descriptionController,
              decoration: const InputDecoration(
                hintText: 'Description',
              ),
              // maxLines: 3,
            ),
            const SizedBox(height: 10),
            // ColorPicker(
            //   pickersEnabled: const {
            //     ColorPickerType.wheel: true,
            //   },
            //   color: Colors.blue,
            //   onColorChanged: (Color color) {
            //     setState(() {
            //       _selectedColor = color;
            //     });
            //   },
            //   heading: const Text('Select color'),
            //   subheading: const Text('Select a different shade'),
            // ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                await uploadTaskToDb();
              },
              child: const Text('SUBMIT'),
            ),
          ],
        ),
      ),
    );
  }
}
