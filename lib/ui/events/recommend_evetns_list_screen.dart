

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
                                            image: NetworkImage(
                                                snapshot.data[index].poster),
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
                                              child: Image(
                                                  image: AssetImage(
                                                      "assets/images/avatar3.png"))))
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
                                          child: Text(
                                              "${snapshot.data[index].name}",
                                              style: TextStyle(
                                                  fontSize: 25.0,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w800))),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              left: 4.0, right: 8.0, bottom: 8.0),
                                          child: Text(
                                              "${snapshot.data[index].description}",
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
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 20)),
                                  // color: Color(0xffF13B5E),
                                  color: Color(0xffE8E8E8),
                                  textColor: Color(0xffF13B5E),
                                  onPressed: () {},
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6)),
                                ),
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
