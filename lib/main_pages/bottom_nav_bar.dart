import 'package:ecologist_app/main_pages/calculation_page.dart';
import 'package:ecologist_app/main_pages/map_page.dart';
import 'package:ecologist_app/main_pages/my_transport_page.dart';
import 'package:ecologist_app/main_pages/report_page.dart';
import 'package:flutter/material.dart';
import '../components/constants.dart';

class BottomNavBar extends StatefulWidget {
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedIndex = 0;
  final screens = [
    MapPage(cityName: 'Almaty', countryName: 'KZ'),
    CalculationPage(),
    MyTransportPage(),
    ReportPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: kElementsColor,
        currentIndex: selectedIndex,
        onTap: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Map'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calculate), label: 'Calculate'),
          BottomNavigationBarItem(
              icon: Icon(Icons.fire_truck), label: 'My Transport'),
          BottomNavigationBarItem(icon: Icon(Icons.report), label: 'Reports'),
        ],
      ),
      body: screens[selectedIndex],
    );
  }
}
