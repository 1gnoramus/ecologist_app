import 'package:flutter/material.dart';

import '../components/constants.dart';

class CalculationPage extends StatefulWidget {
  @override
  State<CalculationPage> createState() => _CalculationPageState();
}

class _CalculationPageState extends State<CalculationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainThemeColor1,
      body: Center(
        child: Text(
          '2+2=4',
          style: TextStyle(fontSize: 50.0, color: kFontColor),
        ),
      ),
    );
  }
}
