import 'package:flutter/material.dart';
import 'package:hackathon_gc/data/model/event.dart';
import 'package:hackathon_gc/ui/bloc/event_bloc.dart';

import 'event_info_screen.dart';

class MainEventsScreen extends StatefulWidget {
  @override
  _MainEventsScreenState createState() => _MainEventsScreenState();
}

class _MainEventsScreenState extends State<MainEventsScreen> {
  var eventBloc = EventBloc();

  @override
  void initState() {
    eventBloc.getEvents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Мероприятия")),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          controller: ScrollController(),
          child: StreamBuilder<List<EventModel>>(
            stream: eventBloc.events,
            builder: (BuildContext context,
                AsyncSnapshot<List<EventModel>> snapshot) {
              Widget child;
              var bufferWidgets = <Widget>[];
              if (snapshot.hasData) {
                // bufferWidgets.add(_buildEventsScroller());
                bufferWidgets.add(Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'Все мероприятия',
                      style: TextStyle(fontSize: 16),
                    )));
                snapshot.data.forEach((element) {
                  bufferWidgets.add(Padding(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => EventInfoScreen(eventId: element.id)),
                          );
                        },
                        child: Card(
                            child: Column(
                          children: [
                            Container(
                              height: 200.0,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0)),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      element.poster),
                                  fit: BoxFit.fill,
                                ),
                                shape: BoxShape.rectangle,
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text("${element.name}",
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w700))),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                  padding: EdgeInsets.only(left:8.0, right: 8.0, bottom: 8.0),
                                  child: Text("${element.description}",
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w400))),
                            )
                          ],
                        )),
                      )));
                });
                child = Column(
                  children: bufferWidgets,
                  crossAxisAlignment: CrossAxisAlignment.start,
                );
              } else if (snapshot.hasError) {
                child = Container();
              } else {
                child = Container();
              }
              return child;
            },
          ),
        ));
  }
}
