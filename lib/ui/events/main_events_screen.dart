
import 'package:flutter/material.dart';

class MainEventsScreen extends StatefulWidget {
  @override
  _MainEventsScreenState createState() => _MainEventsScreenState();
}

class _MainEventsScreenState extends State<MainEventsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Мероприятия")),
      body: Container(
        alignment: Alignment.center,
        child: Text("Список какой-нибудь хуйни", style: TextStyle(fontSize: 22.0), textAlign: TextAlign.center),
      )
    );;
  }
}
