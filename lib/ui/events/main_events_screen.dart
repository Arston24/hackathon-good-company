
import 'package:flutter/material.dart';

import 'events_list_screen.dart';
import 'events_on_map_screen.dart';

class MainEventsScreen extends StatefulWidget {
  @override
  _MainEventsScreenState createState() => _MainEventsScreenState();
}

class _MainEventsScreenState extends State<MainEventsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              labelStyle: TextStyle(fontSize: 16.0,fontFamily: 'Family Name', fontWeight: FontWeight.w500),  //For Selected tab
              tabs: [
                Tab(text: 'Список'),
                Tab(text: 'Карта'),
              ],
            ),
            title: Text('События'),
          ),
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              EventsListScreen(),
              EventsOnMapScreen(),
            ],
          ),
        ),
      ),
    );;
  }
}
