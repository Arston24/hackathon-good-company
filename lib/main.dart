import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hackathon_gc/ui/intro_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'OpenSans', primaryColor: Colors.deepPurple[300], primarySwatch: Colors.deepPurple),
      home: IntroScreen(),
    );
  }
}
