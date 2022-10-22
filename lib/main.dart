import 'package:ecologist_app/roles/driver_role/driver_main.dart';
import 'package:ecologist_app/roles/receiver_role/receiver_main.dart';
import 'package:ecologist_app/roles/sender_role/sender_main.dart';
import 'package:ecologist_app/roles/storage_role/storage_main.dart';
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
        LoginPage.id: (context) => LoginPage(),
        DriverMainPage.id: (context) => DriverMainPage(),
        ReceiverMainPage.id: (context) => ReceiverMainPage(),
        SenderMainPage.id: (context) => SenderMainPage(),
        StorageMainPage.id: (context) => StorageMainPage(),
      },
      initialRoute: WelcomePage.id,
    );
  }
}
