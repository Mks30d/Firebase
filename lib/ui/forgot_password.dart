import 'package:firebase/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final emailController = TextEditingController();
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(hintText: "Enter email..."),
            ),
            ElevatedButton(
                onPressed: () {
                  auth.sendPasswordResetEmail(email: emailController.text).then(
                    (value) {
                      successScaffoldMessage(context);
                    },
                  ).onError(
                    (error, stackTrace) {
                      errorScaffoldMessage(context, error.toString());
                    },
                  );
                },
                child: Text("Forgot"))
          ],
        ),
      ),
    );
  }
}
