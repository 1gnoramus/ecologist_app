import 'package:flutter/material.dart';

import '../components/constants.dart';

class MyTransportPage extends StatefulWidget {
  @override
  State<MyTransportPage> createState() => _MyTransportPageState();
}

class _MyTransportPageState extends State<MyTransportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainThemeColor1,
      body: Center(
        child: Text(
          'My Transport',
          style: TextStyle(fontSize: 50.0, color: kFontColor),
        ),
      ),
    );
  }
}
