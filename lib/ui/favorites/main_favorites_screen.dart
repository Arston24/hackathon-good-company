
import 'package:flutter/material.dart';
import 'package:hackathon_gc/ui/chat/chat_list_screen.dart';
import 'package:hackathon_gc/ui/chat/mentor_list_screen.dart';
import 'package:hackathon_gc/ui/favorites/favorite_events_screen.dart';
import 'package:hackathon_gc/ui/favorites/my_events_screen.dart';

class MainFavoriteScreen extends StatefulWidget {
  @override
  _MainFavoriteScreenState createState() => _MainFavoriteScreenState();
}

class _MainFavoriteScreenState extends State<MainFavoriteScreen> {
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
                Tab(text: 'Я участвую'),
                Tab(text: 'Сохраненные'),
              ],
            ),
            title: Text('Мои события'),
          ),
          body: TabBarView(
            children: [
              MyEventsScreen(),
              FavoriteEventsScreen(),
            ],
          ),
        ),
      ),
    );;
  }
}
