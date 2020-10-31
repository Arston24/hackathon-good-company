import 'package:flutter/material.dart';
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
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(150),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 50),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8.0),
                                topRight: Radius.circular(8.0)),
                            color: Color(0xffF13B5E),
                            // color: Color(0xffE8E8E8),
                            shape: BoxShape.rectangle,
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 12),
                            child: TextFormField(
                              maxLines: 1,
                              keyboardType: TextInputType.text,
                              autofocus: false,
                              decoration: InputDecoration(
                                  hintText: 'Поиск мероприятий',
                                  hintStyle: TextStyle(
                                      color: Colors.black,
                                      decoration: TextDecoration.underline,
                                      fontSize: 20)),
                              validator: (value) => value.isEmpty
                                  ? 'Поле не может быть пустым'
                                  : null,
                            ),
                          ),
                        ),
                        // Padding(padding: EdgeInsets.only(top: 12),),
                        Container(
                          color: Color(0xffF13B5E),
                          child: TabBar(
                            // isScrollable: true,
                            labelStyle: TextStyle(
                                fontSize: 16.0,
                                fontFamily: 'Family Name',
                                fontWeight: FontWeight.w500), //For Selected tab
                            tabs: [
                              Tab(
                                text: 'Список',
                              ),
                              Tab(text: 'Рекомендации'),
                              Tab(text: 'Карта'),
                            ],
                          ),
                        )
                      ],
                    )),
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
    );
    ;
  }
}
