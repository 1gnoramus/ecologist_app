import 'package:flutter/material.dart';

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
                    Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              child: Center(
                                child: Text(
                                  'ФОТО',
                                  style: TextStyle(
                                      fontSize: 20.0, color: Colors.black),
                                ),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 30.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20.0),
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text('Редактировать',
                                  style: TextStyle(
                                      fontSize: 10.0, color: Colors.black54)),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          children: [
                            ProfileMainInfoPiece(
                              text: name,
                            ),
                            ProfileMainInfoPiece(
                              text: 'Возраст:   ${age.toString()}',
                            ),
                            ProfileMainInfoPiece(
                              text: 'Пол:  ${sex}',
                            ),
                            ProfileMainInfoPiece(
                              text: phoneNumber,
                            ),
                            ProfileMainInfoPiece(
                              text: email,
                            ),
                          ],
                        ),
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
