import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../signin_page.dart';

class SplashServices {
  void isSignin(BuildContext context) {
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
