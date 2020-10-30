import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class IntroScreen extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Home();
  }

  void getUser(BuildContext context) async {
    final user = await _auth.currentUser;
    if (user != null) {
      await Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    } else {
      // await Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => InputPhoneNumberScreen()),
      // );
    }
  }
}
