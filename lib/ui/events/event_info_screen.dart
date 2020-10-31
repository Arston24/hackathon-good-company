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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Мероприятие'),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          controller: ScrollController(),
          child:

          Image(
              image: AssetImage(
                  "assets/images/Frame12.png"))

          // StreamBuilder<EventModel>(
          //   stream: eventBloc.event,
          //   builder:
          //       (BuildContext context, AsyncSnapshot<EventModel> snapshot) {
          //     Widget child;
          //
          //     if (snapshot.hasData) {
          //       child = SingleChildScrollView(
          //         child: Column(children: <Widget>[
          //           Container(
          //             height: 200.0,
          //             width: double.infinity,
          //             decoration: BoxDecoration(
          //               image: DecorationImage(
          //                 image: NetworkImage(snapshot.data.poster),
          //                 fit: BoxFit.cover,
          //               ),
          //               shape: BoxShape.rectangle,
          //             ),
          //           ),
          //           Container(margin: EdgeInsets.only(top: 16.0, bottom: 8.0)),
          //           Align(
          //             alignment: Alignment.centerLeft,
          //             child: Padding(
          //               padding: EdgeInsets.only(left: 12.0, right: 12.0),
          //               child: Row(
          //                 children: [
          //                   Text('${snapshot.data.name}',
          //                       style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w700)),
          //                   IconButton(
          //                       icon: Icon(Icons.share),
          //                       onPressed: () {}
          //                       )
          //                 ],
          //               ),
          //             ),
          //           ),
          //           Container(margin: EdgeInsets.only(top: 8.0, bottom: 8.0)),
          //           Align(
          //             alignment: Alignment.centerLeft,
          //             child: Padding(
          //               padding: EdgeInsets.only(left: 12.0, right: 12.0),
          //               child: Text('${snapshot.data.description}',
          //                   style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500)),
          //             ),
          //           ),
          //           Container(margin: EdgeInsets.only(top: 8.0, bottom: 8.0)),
          //           Align(
          //             alignment: Alignment.centerLeft,
          //             child: Padding(
          //               padding: const EdgeInsets.only(left: 12.0, right: 12.0),
          //               child: Text('${snapshot.data.company}',
          //                   textAlign: TextAlign.left,
          //                   style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500)),
          //             ),
          //           ),
          //           Container(margin: EdgeInsets.only(top: 12.0, bottom: 12.0)),
          //           Container(
          //             padding: EdgeInsets.only(left: 12.0, right: 12.0),
          //             width: double.infinity,
          //             child: OutlineButton(
          //               borderSide: BorderSide(color: Colors.blue),
          //               child: Text(
          //                 '$buttonText',
          //                 style: TextStyle(color: Colors.blue),
          //               ),
          //               onPressed: () {
          //                 setState(() {
          //                   if (buttonText == 'Буду участвовать!') {
          //                     buttonText = 'Покинуть событие';
          //                   } else {
          //                     buttonText = 'Буду участвовать!';
          //                   }
          //                 });
          //               },
          //             ),
          //           ),
          //
          //           // Edit text
          //         ]),
          //       );
          //     } else if (snapshot.hasError) {
          //       child = Center();
          //     } else {
          //       child = Center();
          //     }
          //     return child;
          //   },
          // ),
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
