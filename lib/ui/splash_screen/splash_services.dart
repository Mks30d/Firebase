import 'dart:async';

import 'package:firebase/ui/main_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../signin_page.dart';

class SplashServices {
  void isSignin(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser; // for checking user is signin or not, if null then not signin

    if (user != null) {
      Timer(
        Duration(seconds: 2),
        () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => MainPage(),
            ),
          );
        },
      );
    } else {
      Timer(
        Duration(seconds: 2),
        () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => SigninPage(),
            ),
          );
        },
      );
    }
  }
}
