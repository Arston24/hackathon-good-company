import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hackathon_gc/data/model/event.dart';
import 'package:hackathon_gc/ui/bloc/event_bloc.dart';
import 'package:intl/intl.dart';

class EventInfoScreen extends StatefulWidget {
  EventInfoScreen({@required this.eventId});

  final String eventId;

  @override
  _EventInfoScreenState createState() => _EventInfoScreenState();
}

class _EventInfoScreenState extends State<EventInfoScreen> {
  final eventBloc = EventBloc();
  final formatter = DateFormat('yyyy-MM-dd hh:mm');
  var buttonText = 'Буду участвовать!';
  var textEditingController = TextEditingController();

  // static const LatLng _center = const LatLng(45.521563, -122.677433);

  @override
  void didChangeDependencies() {
    eventBloc.getEvent(widget.eventId);
    // eventBloc.getEventCommetns(widget.eventId);
    // eventBloc.addParticipantsListener();
    // eventBloc.isMember(widget.eventId).then((isParticipant) => {
    //       if (isParticipant)
    //         {buttonText = 'Покинуть мероприятие'}
    //       else
    //         {buttonText = 'Присоединиться'}
    //     });
    // eventBloc.getEventWithParticipants(widget.eventId);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
//    eventBloc.dispose();
    super.dispose();
  }

  // Widget _buildParticipantsScroller(List<ParticipantsModel> participants) {
  //   return Padding(
  //     padding: const EdgeInsets.only(top: 2.0),
  //     child: SizedBox.fromSize(
  //       size: Size.fromHeight(75.0),
  //       child: ListView.builder(
  //         scrollDirection: Axis.horizontal,
  //         padding: const EdgeInsets.symmetric(horizontal: 12.0),
  //         itemCount: participants.length,
  //         itemBuilder: (BuildContext context, int index) {
  //           var user = participants[index];
  //           return Container(
  //               margin:
  //                   const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
  //               child: GestureDetector(
  //                   onTap: () {
  //                     Navigator.push(
  //                         context,
  //                         MaterialPageRoute(
  //                             builder: (context) =>
  //                                 UserInfoScreen(userId: user.userId)));
  //                   },
  //                   child: CircleAvatar(
  //                     radius: 34,
  //                     backgroundColor: EditProfileScreen.colorById(user.userId),
  //                     child: ClipOval(
  //                       child: SizedBox(
  //                         width: 300,
  //                         height: 300,
  //                         child: user.avatar != null
  //                             ? Image.network(
  //                                 user.avatar,
  //                                 fit: BoxFit.cover,
  //                               )
  //                             : Center(
  //                                 child: Text(
  //                                     '${user.firstName[0]}${user.lastName[0]}',
  //                                     style: TextStyle(
  //                                         fontSize: 24, color: Colors.white),
  //                                     textAlign: TextAlign.center)),
  //                       ),
  //                     ),
  //                   )));
  //         },
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Мероприятие'),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          controller: ScrollController(),
          child: StreamBuilder<EventModel>(
            stream: eventBloc.event,
            builder:
                (BuildContext context, AsyncSnapshot<EventModel> snapshot) {
              Widget child;

              if (snapshot.hasData) {
                child = SingleChildScrollView(
                  child: Column(children: <Widget>[
                    Container(
                      height: 200.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(snapshot.data.poster),
                          fit: BoxFit.fill,
                        ),
                        shape: BoxShape.rectangle,
                      ),
                    ),
                    Container(margin: EdgeInsets.only(top: 16.0, bottom: 8.0)),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 12.0, right: 12.0),
                        child: Text('${snapshot.data.name}',
                            style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w700)),
                      ),
                    ),
                    Container(margin: EdgeInsets.only(top: 8.0, bottom: 8.0)),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 12.0, right: 12.0),
                        child: Text('${snapshot.data.description}',
                            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500)),
                      ),
                    ),
                    Container(margin: EdgeInsets.only(top: 8.0, bottom: 8.0)),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                        child: Text('${snapshot.data.company}',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500)),
                      ),
                    ),
                    // Padding(
                    //   padding: EdgeInsets.all(16.0),
                    //   child: Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: <Widget>[
                    //         Container(margin: EdgeInsets.only(top: 8.0)),
                    //         Text('Адрес:',
                    //             style: TextStyle(
                    //                 fontSize: 16.0,
                    //                 fontWeight: FontWeight.bold)),
                    //         Container(margin: EdgeInsets.only(top: 8.0)),
                    //         Text('${snapshot.data.eventModel.address}',
                    //             style: TextStyle(fontSize: 16.0)),
                    //         Container(margin: EdgeInsets.only(top: 16.0)),
                    //         Text('Начало:',
                    //             style: TextStyle(
                    //                 fontSize: 16.0,
                    //                 fontWeight: FontWeight.bold)),
                    //         Container(margin: EdgeInsets.only(top: 8.0)),
                    //         Text(
                    //             '${formatter.format(snapshot.data.eventModel.start)}',
                    //             style: TextStyle(fontSize: 16.0)),
                    //         Container(margin: EdgeInsets.only(top: 8.0)),
                    //         Text('Завершение:',
                    //             style: TextStyle(
                    //                 fontSize: 16.0,
                    //                 fontWeight: FontWeight.bold)),
                    //         Container(margin: EdgeInsets.only(top: 8.0)),
                    //         Text(
                    //             '${formatter.format(snapshot.data.eventModel.end)}',
                    //             style: TextStyle(fontSize: 16.0)),
                    //         Container(margin: EdgeInsets.only(top: 16.0)),
                    //         RichText(
                    //           text: TextSpan(
                    //               style: TextStyle(
                    //                   decoration: TextDecoration.underline),
                    //               text: 'Участники:',
                    //               recognizer: TapGestureRecognizer()
                    //                 ..onTap = () {
                    //                   // Navigator.push(
                    //                   //     context,
                    //                   //     MaterialPageRoute(
                    //                   //         builder: (context) =>
                    //                   //             ParticipantsListScreen(
                    //                   //                 eventId: snapshot.data
                    //                   //                     .eventModel.id)));
                    //                 }),
                    //         ),
                    //       ]),
                    // ),
                    // _buildParticipantsScroller(snapshot.data.participants),
                    Container(margin: EdgeInsets.only(top: 12.0, bottom: 12.0)),
                    Container(
                      padding: EdgeInsets.only(left: 12.0, right: 12.0),
                      width: double.infinity,
                      child: OutlineButton(
                        borderSide: BorderSide(color: Colors.blue),
                        child: Text(
                          '$buttonText',
                          style: TextStyle(color: Colors.blue),
                        ),
                        onPressed: () {
                          setState(() {
                            if (buttonText == 'Буду участвовать!') {
                              buttonText = 'Покинуть событие';
                            } else {
                              buttonText = 'Буду участвовать!';
                            }
                          });
                        },
                      ),
                    ),

                    // Edit text
                  ]),
                );
              } else if (snapshot.hasError) {
                child = Center();
              } else {
                child = Center();
              }
              return child;
            },
          ),
        ));
  }

  String getCommentTime(DateTime date) {
    var res = '';
    var formatter = DateFormat('hh:mm');
    var formatterForRest = DateFormat('dd MMMM hh:mm');
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);

    if (DateTime(date.year, date.month, date.day) == today) {
      res = 'Сегодня в ${formatter.format(date)}';
    } else if (DateTime(date.year, date.month, date.day) == yesterday) {
      res = 'Вчера в ${formatter.format(date)}';
    } else {
      res = '${formatterForRest.format(date)}';
    }
    return res;
  }
}
