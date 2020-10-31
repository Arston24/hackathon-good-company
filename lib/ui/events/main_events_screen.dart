import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hackathon_gc/ui/events/recommend_evetns_list_screen.dart';

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
          length: 3,
          child: Scaffold(
            body: DefaultTabController(
              length: 3,
              child: Scaffold(
                appBar: AppBar(
                  bottom: TabBar(
                    isScrollable: true,
                    labelStyle: TextStyle(
                        fontSize: 16.0,
                        fontFamily: 'Family Name',
                        fontWeight: FontWeight.w500), //For Selected tab
                    tabs: [
                      Tab(text: 'Список'),
                      Tab(text: 'Рекомендации'),
                      Tab(text: 'Карта'),
                    ],
                  ),
                  title: Row(
                    children: [
                      Text(
                        'События',
                        style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.w500),
                      ),
                      Spacer(),
                      Icon(Icons.search),
                    ],
                  ),
                ),
                body: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    EventsListScreen(),
                    RecommendsEventsListScreen(),
                    EventsOnMapScreen(),
                  ],
                ),
              ),
            ),
          )),
    );
  }


}
