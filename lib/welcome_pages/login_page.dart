import 'package:ecologist_app/components/button_2.dart';
import 'package:ecologist_app/main_pages/bottom_nav_bar.dart';
import 'package:ecologist_app/main_pages/map_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/constants.dart';
import 'package:ecologist_app/components/button_1.dart';

class LoginPage extends StatefulWidget {
  static String id = 'login_page';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool showSpinner = false;
  String email = '';
  String password = '';
  final GlobalKey _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      backgroundColor: kMainThemeColor1,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 100.0),
            decoration: BoxDecoration(
              color: Color(0xFF757575),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20.0),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 100.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Login',
                  style: TextStyle(
                    color: kFontColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 50.0,
                  ),
                ),
                SizedBox(
                  height: 48.0,
                ),
                TextField(
                  cursorColor: Colors.black87,
                  style: TextStyle(color: Colors.black38),
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: InputDecoration(
                    icon: Icon(Icons.email),
                    hintText: 'Email ID',
                    hintStyle: TextStyle(color: Colors.black38),
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                TextField(
                  style: TextStyle(color: Colors.black38),
                  obscureText: true,
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: InputDecoration(
                    icon: Icon(Icons.password),
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Colors.black38),
                  ),
                ),
                SizedBox(
                  height: 80.0,
                ),
                Center(
                  child: Button_1(
                      textColor: kMainThemeColor1,
                      color: kElementsColor,
                      buttonText: 'Login',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BottomNavBar(),
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
