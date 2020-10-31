import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {

  final userNotificationsList = ["Проводится Хакатон!", "Соревнование по шахматам", "StandUp", "Конкурс"];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView.builder(
        itemCount: userNotificationsList.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(

            child: Column(
              children: [
                Row(
                  children: [
                    Text(userNotificationsList[index]),
                    Text("20:09")
                  ],
                ), // title

              ],
            ),
          );
        },
      ),
    );
  }
}
