import 'package:flutter/material.dart';
import '../components/constants.dart';

class ReportPage extends StatefulWidget {
  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainThemeColor1,
      body: Center(
        child: Text(
          'Report',
          style: TextStyle(fontSize: 50.0, color: kFontColor),
        ),
      ),
    );
  }
}
