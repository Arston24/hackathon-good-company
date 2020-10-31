import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hackathon_gc/data/model/event.dart';
import 'package:hackathon_gc/ui/bloc/event_bloc.dart';

import 'event_info_screen.dart';

class EventsListScreen extends StatefulWidget {
  @override
  _EventsListScreenState createState() => _EventsListScreenState();
}

class _EventsListScreenState extends State<EventsListScreen> {
  var eventBloc = EventBloc();

  @override
  void initState() {
    eventBloc.getEvents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      controller: ScrollController(),
      child: StreamBuilder<List<EventModel>>(
        stream: eventBloc.events,
        builder:
            (BuildContext context, AsyncSnapshot<List<EventModel>> snapshot) {
          Widget child;
          var bufferWidgets = <Widget>[];
          if (snapshot.hasData) {
            // bufferWidgets.add(_buildEventsScroller());
            bufferWidgets.add(Padding(
              padding: EdgeInsets.all(8.0),
            ));
            snapshot.data.forEach((element) {
              bufferWidgets.add(Padding(
                  padding: EdgeInsets.only(left: 8, right: 8),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                EventInfoScreen(eventId: element.id)),
                      );
                    },
                    child: Card(
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      height: 200.0,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10.0),
                                        image: DecorationImage(
                                          image: NetworkImage(element.poster),
                                          fit: BoxFit.fill,
                                        ),
                                        shape: BoxShape.rectangle,
                                      ),
                                    ),
                                    Positioned(
                                        top: -5,
                                        right: 10,
                                        child: Container(
                                            width: 60,
                                            height: 60,
                                            child: Image(image: AssetImage("assets/images/avatar3.png")))
                                    )
                                  ],
                                ),

                              ],
                            ),
                            Positioned(
                                bottom: 0,
                                left: 0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(left: 4.0),
                                        child: Text("${element.name}",
                                            style: TextStyle(
                                                fontSize: 25.0,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w800))),
                                    Padding(
                                        padding: EdgeInsets.only(
                                          left: 4.0,
                                            right: 8.0, bottom: 8.0),
                                        child: Text("${element.description}",
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400)))
                                  ],
                                )),
                            Positioned(
                              bottom: 0,
                              right: 10,
                              child: MaterialButton(
                                minWidth: 150,
                                height: 35,
                                child: Text("Записаться",
                                    style:
                                    TextStyle(fontWeight: FontWeight.w800, fontSize: 20)),
                                // color: Color(0xffF13B5E),
                                color: Color(0xffE8E8E8),
                                textColor: Color(0xffF13B5E),
                                onPressed: () {},
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6)),
                              ),
                            )
                          ] ,
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
