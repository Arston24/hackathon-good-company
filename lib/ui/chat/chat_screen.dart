import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PrivateChatScreen extends StatefulWidget {
  String userId;

  PrivateChatScreen({@required this.userId});

  @override
  _PrivateChatScreenState createState() => _PrivateChatScreenState();
}

class _PrivateChatScreenState extends State<PrivateChatScreen> {
  var textEditingController = TextEditingController();
  final ScrollController listScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  var messages = <String>[
    "Все в порядке, полностью готов.",
    "Как успехи с подготовкой?",
    "Здравствуйте!",
    "Добрый день!"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Кирилл Петров'),
      ),
      body: WillPopScope(
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Flexible(
                    child: ListView.builder(
                  padding: EdgeInsets.all(10.0),
                  itemBuilder: (context, index) => buildItem(index),
                  itemCount: 4,
                  reverse: true,
                  controller: listScrollController,
                )),
                Container(
                  child: Row(
                    children: <Widget>[
                      // Button send image
                      // Edit text
                      Flexible(
                        child: Container(
                          child: TextField(
                            style:
                                TextStyle(color: Colors.black, fontSize: 15.0),
                            controller: textEditingController,
                            decoration: InputDecoration.collapsed(
                              hintText: 'Введите сообщение...',
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                      ),

                      // Button send message
                      Material(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 8.0),
                          child: IconButton(
                            icon: Icon(Icons.send),
                            onPressed: () => {
                              // chatsBloc.sendNewMessage(
                              //     widget.userId, textEditingController.text),
                              textEditingController.clear()
                            },
                            color: Colors.blueAccent,
                          ),
                        ),
                        color: Colors.white,
                      ),
                    ],
                  ),
                  width: double.infinity,
                  height: 50.0,
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(color: Colors.grey, width: 0.5)),
                      color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  onSendMessage(String text, int i) {}

  Widget buildItem(int index) {
    var message = messages[index];
    return index % 2 == 0
        ? Wrap(children: [
            Align(
                alignment: Alignment.centerRight,
                child: Container(
                  child: Text(
                    message,
                    style: TextStyle(color: Colors.black),
                  ),
                  padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                  decoration: BoxDecoration(
                      color: Colors.deepPurple[200],
                      borderRadius: BorderRadius.circular(8.0)),
                  margin: EdgeInsets.only(bottom: 10.0, left: 50.0),
                ))
          ])
        : Wrap(children: [
            Row(
              children: [
                Container(
                    margin: EdgeInsets.only(left: 4.0, right: 4.0, bottom: 10.0),
                    child: CircleAvatar(
                      radius: 16,
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
                Container(
                  child: Text(
                    message,
                    style: TextStyle(color: Colors.white),
                  ),
                  padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                  decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(8.0)),
                  margin: EdgeInsets.only(left: 10.0, bottom: 10.0),
                ),
              ],
            )
          ]);
  }
}
