
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
                    child: Card(
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        EventInfoScreen(eventId: element.id)));
                          },
                          title: Text('${element.name}'),
                          subtitle: Text('${element.company}'),
                        ))));
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
