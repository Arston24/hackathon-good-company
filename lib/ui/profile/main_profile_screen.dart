import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hackathon_gc/data/model/user.dart';
import 'package:hackathon_gc/ui/bloc/bloc.dart';
import 'package:path/path.dart';

class ProfileMainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProfileMainScreenState();
  }
}

class ProfileMainScreenState extends State<ProfileMainScreen> {
  final bloc = Bloc();

  final profileItemList = ["Подписки", "Мероприятия", "Календарь", "Достижения", "Профессия", "Настройки" ];
  final profileSettingsIconsList = ["icon_list-with-dots.svg", "icon_flag.svg", "icon_calendar-page-empty.svg", "icon_trophy.svg", "icon_briefcase.svg", "icon_settigns.svg"];
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
        // appBar: AppBar(
        //   title: Text('Профиль'),
        //   actions: <Widget>[
        //     Padding(
        //       padding: EdgeInsets.only(right: 20.0),
        //       // child: GestureDetector(
        //       //   onTap: () {
        //       //     Navigator.push(
        //       //         context,
        //       //         MaterialPageRoute(builder: (context) => EditProfileScreen()));
        //       //   },
        //       //   child: Icon(
        //       //     Icons.edit,
        //       //     size: 26.0,
        //       //   ),
        //       // )
        //     ),
        //     Padding(
        //         padding: EdgeInsets.only(right: 20.0),
        //         child: GestureDetector(
        //           onTap: () {},
        //           child: Icon(
        //             Icons.exit_to_app,
        //             size: 26.0,
        //           ),
        //         )),
        //   ],
        // ),
        body: SingleChildScrollView(
            // <-- wrap this around
            child: profile()));
  }

  Widget profile() {
    print("profile");
    return FutureBuilder<UserModel>(
      future: bloc.getCurrentUser(),
      builder: (BuildContext context, AsyncSnapshot<UserModel> snapshot) {
        if (snapshot.hasData) {
          print("(snapshot.hasData)");

          return Column(
            children: [
              Container(
                width: double.infinity,
                height: 225,
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 175,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                            Color.fromRGBO(0, 245, 160, 1),
                            Color.fromRGBO(0, 217, 245, 1)
                          ])),
                    ),
                    Positioned(
                      top: 75,
                      left: 120,
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.0),
                          color: Color(0xff5845D1),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              // Padding(padding: EdgeInsets.only(top: 15)),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            "Кличко Павлович Александр",
                            // "${snapshot.data.firstName}",
                            style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 24))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            "ID: Rat6969",
                            // "ID: ${snapshot.data.userId}",
                            style:
                            TextStyle(fontWeight: FontWeight.w500, fontSize: 15))
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 15),
                      child: MaterialButton(
                        minWidth: 220,
                        height: 40,
                        child: Text("Редактировать аккаунт",
                            style:
                            TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
                        // color: Color(0xffF13B5E),
                        color: Color(0xffF13B5E),
                        textColor: Colors.white,
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("За Октябрь",
                            style:
                            TextStyle(fontWeight: FontWeight.w600, fontSize: 25))
                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceAround,

                      children: [
                        SvgPicture.asset("assets/images/Ellipse1.svg"),
                        // Padding(
                        //   padding: EdgeInsets.only(left: 20),
                        // ),
                        SvgPicture.asset("assets/images/Ellipse2.svg"),
                        // Padding(
                        //   padding: EdgeInsets.only(left: 20),
                        // ),
                        SvgPicture.asset("assets/images/Ellipse3.svg"),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 45),
                    ),
                    Container(
                      width: double.infinity,
                      height: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Color(0xff00E0C1),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset("assets/images/icon_email.svg"),
                          Text("Твой e-mail не подтвержден",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 20)),
                          Text("Отправить письмо повторно?",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 15))
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 35),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Мой аккаунт",
                            style:
                            TextStyle(fontWeight: FontWeight.w600, fontSize: 25))
                      ],
                    ),
                    Container(
                      height: 420,

                      child: ListView.builder(
                        itemCount: profileItemList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            height: 65,
                            child: GestureDetector(
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(color: Colors.black, width: 2),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(15.0))),
                                child: Row(
                                  children: [
                                    Padding(padding: EdgeInsets.only(left: 10)),
                                    Text(profileItemList[index], style: TextStyle(
                                        fontWeight: FontWeight.w600, fontSize: 20)),
                                    Spacer(),
                                    SvgPicture.asset("assets/images/" + profileSettingsIconsList[index]),
                                    Padding(padding: EdgeInsets.only(right: 10)),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                )
              )

            ],
          );
        } else {
          print("(snapshot.hasNOData)");
          return Center(child: CircularProgressIndicator());
        }
        ;
      },
    );
  }
}
