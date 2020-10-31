import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hackathon_gc/data/model/user.dart';
import 'package:hackathon_gc/ui/bloc/user_bloc.dart';
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
      body: ListView.builder(
          itemCount: 12,
          itemBuilder: (BuildContext context, int index) {
        return Card(
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
                            "https://i.kinja-img.com/gawker-media/image/upload/t_original/ijsi5fzb1nbkbhxa2gc1.png",
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
                        'Вы: Добрый день!',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
            ]));
      }),
    );
  }
}
