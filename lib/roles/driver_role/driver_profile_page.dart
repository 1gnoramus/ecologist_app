// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/constants.dart';

class DriverProfilePage extends StatefulWidget {
  static String id = 'profile_page';

  @override
  State<DriverProfilePage> createState() => _DriverProfilePageState();
}

class _DriverProfilePageState extends State<DriverProfilePage> {
  String name = 'ФИО';
  int age = 21;
  String sex = 'Мужской';
  String phoneNumber = '+7-778-057-66-72';
  String email = 'a@mail.ru';
  String rank = 'А+';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.logout),
          ),
        ],
        title: Text('Профиль'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: ListView(children: [
              Container(
                margin: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                            backgroundColor: Colors.grey,
                            radius: 50.0,
                            child: Icon(
                              Icons.photo,
                              size: 40.0,
                              color: Colors.black54,
                            )),
                        TextButton(
                          onPressed: () {},
                          child: Text('Редактировать',
                              style: TextStyle(
                                  fontSize: 10.0, color: Colors.black54)),
                        ),
                        ProfileDetail(
                            icon: Icons.person,
                            description: 'Имя',
                            hint: 'Степаненко Игорь'),
                        ProfileDetail(
                            icon: Icons.calendar_month,
                            description: 'Возраст',
                            hint: '21 год'),
                        ProfileDetail(
                            icon: Icons.phone,
                            description: 'Номер телефона',
                            hint: '+77054511894'),
                        ProfileDetail(
                            icon: Icons.calendar_month,
                            description: 'Почта',
                            hint: '$email'),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            'A+',
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(fontSize: 40.0, color: Colors.black),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.greenAccent,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(70.0))),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        ProfileMainInfoPiece(text: "Ваш рейтинг: $rank")
                      ],
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

class ProfileMainInfoPiece extends StatelessWidget {
  ProfileMainInfoPiece({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 12.0, color: Colors.black),
      ),
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.symmetric(horizontal: 50.0),
      width: 200.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(5.0),
        ),
      ),
    );
  }
}

class ProfileDetail extends StatelessWidget {
  const ProfileDetail({
    required this.icon,
    required this.description,
    required this.hint,
  });

  final IconData icon;
  final String description;
  final String hint;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      decoration: BoxDecoration(
        border: BoxBorder.lerp(Border.all(color: Colors.black45),
            Border.all(color: Colors.black45), 15.0),
        borderRadius: BorderRadius.all(
          Radius.circular(30.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 50,
            color: Colors.black54,
          ),
          SizedBox(
            width: 20.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('$description',
                  style: GoogleFonts.ubuntu()
                      .copyWith(fontSize: 12.0, color: Colors.black45)),
              SizedBox(
                height: 8.0,
              ),
              Container(
                height: 20.0,
                width: 200.0,
                child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: hint,
                        hintStyle: GoogleFonts.ubuntu()
                            .copyWith(fontSize: 14.0, color: Colors.black38)),
                    style: GoogleFonts.ubuntu()
                        .copyWith(fontSize: 16.0, color: kFontColor)),
              ),
              // Text(
              //   '54 кг',
              //   style: GoogleFonts.ubuntu().copyWith(
              //       fontSize: 16.0, color: kFontColor),
              // ),
            ],
          )
        ],
      ),
    );
  }
}
