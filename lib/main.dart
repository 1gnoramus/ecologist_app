import 'package:ecologist_app/welcome_pages/login_page.dart';
import 'package:ecologist_app/welcome_pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:ecologist_app/welcome_pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.dark(
          primary: (Color(0xFFD8F762)),
        ),
        scaffoldBackgroundColor: Color(0xFFD8F762),
      ),
      routes: {
        WelcomePage.id: (context) => WelcomePage(),
        LoginPage.id: (context) => LoginPage()
      },
      initialRoute: WelcomePage.id,
    );
  }
}
