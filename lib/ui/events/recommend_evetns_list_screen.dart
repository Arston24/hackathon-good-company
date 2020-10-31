

import 'package:flutter/material.dart';
import 'package:hackathon_gc/data/model/event.dart';
import 'package:hackathon_gc/ui/auth/choose_interests_screen.dart';
import 'package:hackathon_gc/ui/bloc/event_bloc.dart';
import 'package:hackathon_gc/ui/quiz/quiz_screen.dart';

import 'event_info_screen.dart';

class RecommendsEventsListScreen extends StatefulWidget {
  @override
  _RecommendsEventsListScreenState createState() => _RecommendsEventsListScreenState();
}

class _RecommendsEventsListScreenState extends State<RecommendsEventsListScreen> {
  var eventBloc = EventBloc();

  @override
  void initState() {
    eventBloc.getEvents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<EventModel>>(
        stream: eventBloc.events,
        builder:
            (BuildContext context, AsyncSnapshot<List<EventModel>> snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              itemCount: snapshot.data.length - 2,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                    padding: EdgeInsets.only(left: 8, right: 8, top: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EventInfoScreen(
                                  eventId: snapshot.data[index].id)),
                        );
                      },
                      child: Card(
                          elevation: 8.0,
                          child: Column(
                            children: [
                              Container(
                                height: 200.0,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8.0),
                                      topRight: Radius.circular(8.0)),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        snapshot.data[index].poster),
                                    fit: BoxFit.cover,
                                  ),
                                  shape: BoxShape.rectangle,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Container(
                                        padding: EdgeInsets.only(
                                            left: 8.0, right: 8.0),
                                        child: Text(
                                            "${snapshot.data[index].name}",
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w700))),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(0.0),
                                    child: IconButton(
                                        icon: Icon(Icons.favorite_border),
                                        onPressed: null),
                                  )
                                ],
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 8.0, right: 8.0, bottom: 8.0),
                                    child: Text(
                                        "${snapshot.data[index].description}",
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w400))),
                              )
                            ],
                          )),
                    ));
              },
              separatorBuilder: (BuildContext context, int index) {
                if (index == 1) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (_) => ChooseInterestsScreen()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, right: 8.0, top: 8.0),
                      child: Card(
                        elevation: 8.0,
                        shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          width: double.infinity,
                          height: 180.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    Colors.pink[400],
                                    Colors.pink[400]
                                  ])),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 22.0),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Icon(
                                      Icons.assignment_turned_in_rounded,
                                      size: 64.0),
                                ),
                              ),
                              Text(
                                "Нравится учавствовать в конкурсах?",
                                style: TextStyle(
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Пройдите тестирование и получите достижение",
                                style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                } else {
                  return Container();
                }
              },
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
