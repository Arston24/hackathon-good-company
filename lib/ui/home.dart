import 'package:flutter/material.dart';
import 'package:hackathon_gc/ui/profile/main_profile_screen.dart';

import 'contacts/main_contacts_screen.dart';
import 'events/main_events_screen.dart';
import 'notifications/notification_screen.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  var unreadNotifications = 0;

  final List<Widget> _children = [
    MainEventsScreen(),
    ContactsListScreen(),
    NotificationScreen(),
    ProfileMainScreen()
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex], // new
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        // this will be set when a new tab is tapped
        onTap: onTabTapped,
        // new
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            title: Text('Мероприятия'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            title: Text('Контакты'),
          ),
          BottomNavigationBarItem(
            icon: Stack(
              children: <Widget>[
                Icon(Icons.notifications),
                Positioned(
                  right: 0,
                  child: unreadNotifications > 0
                      ? Container(
                          padding: EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          constraints: BoxConstraints(
                            minWidth: 12,
                            minHeight: 12,
                          ),
                          child: Text(
                            '$unreadNotifications',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      : Container(),
                )
              ],
            ),
            title: Text('Уведомления'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text('Профиль'))
        ],
      ),
    );
  }
}

class PlaceholderWidget extends StatelessWidget {
  final Color color;

  PlaceholderWidget(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}
