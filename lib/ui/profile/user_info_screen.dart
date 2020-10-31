// import 'package:flutter/material.dart';
// import 'package:hackathon_gc/data/model/user.dart';
// import 'package:hackathon_gc/ui/bloc/user_bloc.dart';
//
//
// class UserInfoScreen extends StatefulWidget {
//   String userId;
//
//   UserInfoScreen({@required this.userId});
//
//   @override
//   _UserInfoScreenState createState() => _UserInfoScreenState();
// }
//
// class _UserInfoScreenState extends State<UserInfoScreen> {
//   final userBloc = UserBloc();
//
//
//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Пользователь'),
//       ),
//       body: StreamBuilder(
//         stream: userBloc.getUser,
//         builder: (context, AsyncSnapshot<UserModel> snapshot) {
//           if (snapshot.hasData) {
//             return buildInfo(snapshot);
//           } else if (snapshot.hasError) {
//             return Text(snapshot.error.toString());
//           }
//           return Center(child: CircularProgressIndicator());
//         },
//       ),
//     );
//   }
//
//   Widget buildInfo(AsyncSnapshot<UserModel> snapshot) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(children: <Widget>[
//           Container(margin: EdgeInsets.only(top: 16.0, bottom: 8.0)),
//           CircleAvatar(
//             radius: 84,
//             child: ClipOval(
//               child: SizedBox(
//                 width: 300,
//                 height: 300,
//                 child:Image.network(
//                  "",
//                   fit: BoxFit.cover,
//                 )
//               ),
//             ),
//           ),
//           Container(margin: EdgeInsets.only(top: 16.0, bottom: 8.0)),
//           Center(
//             child: Text('${snapshot.data.firstName} ${snapshot.data.lastName}',
//                 style: TextStyle(fontSize: 22.0)),
//           ),
//           Container(margin: EdgeInsets.only(top: 8.0, bottom: 8.0)),
//           Padding(
//               padding: EdgeInsets.all(16.0),
//               child: Center(
//                 child: Text('${snapshot.data.aboutMe}',
//                     style: TextStyle(fontSize: 16.0)),
//               )),
//           Container(margin: EdgeInsets.only(top: 8.0, bottom: 8.0)),
//           Center(
//             child: Text('${snapshot.data.company}',
//                 style: TextStyle(fontSize: 16.0)),
//           ),
//           Padding(
//             padding: EdgeInsets.all(24.0),
//             child:
//             Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
//                 Widget>[
//               Container(margin: EdgeInsets.only(top: 8.0)),
//               Text('Я ищу (каких людей/услуги/товары):',
//                   style:
//                   TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
//               Container(margin: EdgeInsets.only(top: 8.0)),
//               Text('${snapshot.data.interests}',
//                   style: TextStyle(fontSize: 16.0)),
//               Container(margin: EdgeInsets.only(top: 16.0)),
//               Text('Чем могу быть полезен:',
//                   style:
//                   TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
//               Container(margin: EdgeInsets.only(top: 8.0)),
//               Text('${snapshot.data.useful}', style: TextStyle(fontSize: 16.0)),
//               Container(margin: EdgeInsets.only(top: 16.0)),
//               Text('Телефон: ${snapshot.data.phone}',
//                   style:
//                   TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
//             ]),
//           ),
//           Container(margin: EdgeInsets.only(top: 10.0, bottom: 10.0)),
//           Center(
//             child: OutlineButton(
//               color: Colors.lightBlue,
//               child: Text('Написать сообщение'),
//               onPressed: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) =>
//                             PrivateChatScreen(userId: snapshot.data.userId)));
//               },
//             ),
//           ),
//         ]),
//       ),
//     );
//   }
// }
