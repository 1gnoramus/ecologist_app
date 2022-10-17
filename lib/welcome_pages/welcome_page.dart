import 'package:ecologist_app/welcome_pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/constants.dart';
import '../components/button_1.dart';

class WelcomePage extends StatefulWidget {
  static String id = 'welcome_page';

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kMainThemeColor1,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Container(
                  child: Column(
                    children: [
                      Icon(
                        Icons.recycling,
                        color: kElementsColor,
                        size: 100.0,
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      Text(
                        'EcoLogistics',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: kFontColor,
                          fontSize: 40.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 150.0,
              ),
              Center(
                  child: Button_1(
                textColor: kMainThemeColor1,
                color: kElementsColor,
                onTap: () {
                  Navigator.pushNamed(context, LoginPage.id);
                },
                buttonText: 'START',
              ))
            ],
          ),
        ),
      ),
    );
  }
}
