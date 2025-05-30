import 'dart:async';

import 'package:firebase/ui/forgot_password.dart';
import 'package:firebase/ui/signup_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'main_page.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final _formKey = GlobalKey<
      FormState>(); // for validating the email/password entered or not
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;

  Future<bool> loginUserWithEmailAndPassword() async {
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim());

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Successful..."),
          backgroundColor: Colors.green,
        ),
      );

      print("userCredential:--- $userCredential");
      print("user:--- ${userCredential.user}");
      print("email:--- ${userCredential.user!.email}");
      print("uid:--- ${userCredential.user!.uid}");
      return true;
    } catch (e) {
      print("error:--- $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign in Page"),
        backgroundColor: Colors.teal,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Form(
              key: _formKey, // GlobalKey
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: 'Email',
                    ),
                    validator: (value) { // for showing error when email is not entered
                      if (value!.isEmpty) {
                        return "Enter email...";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: passwordController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      hintText: 'Password',
                    ),
                    obscureText: true,
                    validator: (value) { // for showing error when password is not entered
                      if (value!.isEmpty) {
                        return "Enter password...";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          isLoading = true;
                          print("isLoading:-- $isLoading");
                          debugPrint("isLoading");
                        });
                        if (_formKey.currentState!.validate()) { // return true if email/password is entered else false
                          if (await loginUserWithEmailAndPassword()) {
                            setState(() {
                              isLoading = false;
                              print("isLoading:-- $isLoading");
                            });
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MainPage(),
                              ),
                              (route) => false, // This removes all routes behind
                            );
                            _formKey.currentState!.reset(); // to reset form field state
                          }
                        }

                        setState(() {
                          isLoading = false;
                        });
                        print("emailController: ${emailController.text}");
                        print("passwordController: ${passwordController.text}");
                      },
                      child: isLoading
                          ? Container(
                              height: 25,
                              width: 25,
                              child: CircularProgressIndicator(
                                strokeWidth: 3,
                                // strokeAlign: 0.1,
                                strokeCap: StrokeCap.round,
                                color: Colors.purple,
                              ),
                            )
                          : const Text(
                              'SIGN IN',
                            )),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignupPage(),
                          ));
                    },
                    child: RichText(
                      text: TextSpan(
                        text: 'Don\'t have an account? ',
                        style: Theme.of(context).textTheme.titleMedium,
                        // style: TextStyle(color: Colors.black54),
                        children: [
                          TextSpan(
                              text: 'Sign Up',
                              // style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              //       fontWeight: FontWeight.bold,
                              //     ),
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),

                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ForgotPassword(),
                            ));
                      },
                      child: Text("Forgot Password"))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
