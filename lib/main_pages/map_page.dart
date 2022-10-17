import 'package:flutter/material.dart';

import '../components/constants.dart';

class MapPage extends StatefulWidget {
  MapPage({required this.cityName, required this.countryName});
  static String id = 'map_screen';
  final String cityName;
  final String countryName;

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainThemeColor1,
      body: Center(
        child: Text(
          '${widget.cityName} + ${widget.countryName}',
          style: TextStyle(fontSize: 50.0, color: kFontColor),
        ),
      ),
    );
  }
}
