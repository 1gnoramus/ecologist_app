import 'package:ecologist_app/components/button_2.dart';
import 'package:ecologist_app/main_pages/bottom_nav_bar.dart';
import 'package:ecologist_app/main_pages/map_page.dart';
import 'package:ecologist_app/roles/driver_role/driver_main.dart';
import 'package:ecologist_app/roles/sender_role/sender_main.dart';
import 'package:ecologist_app/roles/storage_role/storage_main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
            height: 10.0,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 80.0),
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
                  height: 50.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: LoginButton(
                          color: kElementsColor,
                          buttonText: 'Sender',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SenderMainPage()
                                  // DriverMainPage(),
                                  ),
                            );
                          }),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Center(
                      child: LoginButton(
                          color: kEcoElementsColor,
                          buttonText: 'Driver',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DriverMainPage()),
                            );
                          }),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Center(
                      child: LoginButton(
                        color: Colors.redAccent,
                        buttonText: 'Storage',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StorageMainPage()),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton(
      {required this.color, required this.onTap, required this.buttonText});

  final Color color;
  final VoidCallback onTap;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.symmetric(vertical: 2.0),
      width: 250,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(
          Radius.circular(15.0),
        ),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Center(
          child: Text(buttonText,
              style: GoogleFonts.ubuntu()
                  .copyWith(fontSize: 30.0, color: Colors.white70)),
        ),
      ),
    );
  }
}
