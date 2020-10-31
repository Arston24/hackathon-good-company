import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:hackathon_gc/ui/events/main_events_screen.dart';
import 'package:hackathon_gc/ui/home.dart';

class ChooseInterestsScreen extends StatefulWidget {
  @override
  _ChooseInterestsScreenState createState() => _ChooseInterestsScreenState();
}

class _ChooseInterestsScreenState extends State<ChooseInterestsScreen> {
  List<String> tags = [];

  List<String> options = [
    'Математика',
    'Физика',
    'Химия',
  ];

  List<String> options2 = [
    'Робототехника',
    'Программирование',
  ];

  List<String> options3 = [
    'Схемотехника',
    'Билогия',
    'Спорт',
  ];

  List<String> options4 = [
    'Фотография',
    'Танцы',
    'Компьютеры',
  ];

  List<String> options5 = [
    'Музыка',
    'Исскуство',
    'Дизайн',
  ];

  List<String> options6 = [
    'Иностранные языки',
    'Киберспорт',
  ];


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Visibility(
            visible: tags.length > 0,
            child: Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                Home()), (Route<dynamic> route) => false);
                  },
                  child: Icon(
                    Icons.done,
                    size: 26.0,
                  ),
                )),
          ),
        ],
        title: Text("Интересы"),
      ),
      body: Container(
        child: Column(
          children: [
            ChipsChoice<String>.multiple(
              value: tags,
              onChanged: (val) => setState(() => tags = val),
              choiceItems: C2Choice.listFrom<String, String>(
                source: options,
                value: (i, v) => v,
                label: (i, v) => v,
                tooltip: (i, v) => v,
              ),
            ),
            ChipsChoice<String>.multiple(
              value: tags,
              onChanged: (val) => setState(() => tags = val),
              choiceItems: C2Choice.listFrom<String, String>(
                source: options2,
                value: (i, v) => v,
                label: (i, v) => v,
                tooltip: (i, v) => v,
              ),
            ),
            ChipsChoice<String>.multiple(
              value: tags,
              onChanged: (val) => setState(() => tags = val),
              choiceItems: C2Choice.listFrom<String, String>(
                source: options3,
                value: (i, v) => v,
                label: (i, v) => v,
                tooltip: (i, v) => v,
              ),
            ),
            ChipsChoice<String>.multiple(
              value: tags,
              onChanged: (val) => setState(() => tags = val),
              choiceItems: C2Choice.listFrom<String, String>(
                source: options4,
                value: (i, v) => v,
                label: (i, v) => v,
                tooltip: (i, v) => v,
              ),
            ),
            ChipsChoice<String>.multiple(
              value: tags,
              onChanged: (val) => setState(() => tags = val),
              choiceItems: C2Choice.listFrom<String, String>(
                source: options5,
                value: (i, v) => v,
                label: (i, v) => v,
                tooltip: (i, v) => v,
              ),
            ),
            ChipsChoice<String>.multiple(
              value: tags,
              onChanged: (val) => setState(() => tags = val),
              choiceItems: C2Choice.listFrom<String, String>(
                source: options6,
                value: (i, v) => v,
                label: (i, v) => v,
                tooltip: (i, v) => v,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
