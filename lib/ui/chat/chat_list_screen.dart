import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hackathon_gc/data/model/user.dart';
import 'package:hackathon_gc/ui/bloc/user_bloc.dart';
import 'package:hackathon_gc/ui/chat/chat_screen.dart';
import 'package:path/path.dart';

class ChatListScreen extends StatefulWidget {
  @override
  _ChatListScreenState createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  final userBloc = UserBloc();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        PrivateChatScreen(userId: "null"))),
            child: Card(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                  Container(
                      margin: EdgeInsets.all(8),
                      child: CircleAvatar(
                        radius: 24,
                        child: ClipOval(
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: Image.network(
                                "https://avatars.mds.yandex.net/get-zen_doc/198554/pub_5bfcd448dfc89b00aa85f36d_5bfcd9df793dec00aa607bca/scale_2400",
                                fit: BoxFit.cover),
                          ),
                        ),
                      )),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            'Кирилл Петров',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16.0,
                            ),
                          ),
                          Text(
                            'Вы: Все в порядке, полностью готов.',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                ])),
          ),
          Card(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                Container(
                    margin: EdgeInsets.all(8),
                    child: CircleAvatar(
                      radius: 24,
                      child: ClipOval(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: Image.network(
                              "https://cdn.comsol.com/wordpress/2017/02/Christopher-Boucher_COMSOL-Blog-author.png",
                              fit: BoxFit.cover),
                        ),
                      ),
                    )),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          'Александр Баннов',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.0,
                          ),
                        ),
                        Text(
                          'Как закончите, напишите, пожалуйста',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
              ])),
          Card(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                Container(
                    margin: EdgeInsets.all(8),
                    child: CircleAvatar(
                      radius: 24,
                      child: ClipOval(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: Image.network(
                              "https://www.penguin.co.uk/content/dam/prh/company-pages/newltpics/Val%20Garside%205-300.png",
                              fit: BoxFit.cover),
                        ),
                      ),
                    )),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          'Екатерина Смирнова',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.0,
                          ),
                        ),
                        Text(
                          'Удачи!',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
              ]))
        ],
      ),
    );
  }
}
