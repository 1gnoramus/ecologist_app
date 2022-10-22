import 'package:ecologist_app/main_pages/calculation_page.dart';
import 'package:ecologist_app/main_pages/map_page.dart';
import 'package:ecologist_app/main_pages/my_transport_page.dart';
import 'package:ecologist_app/main_pages/report_page.dart';
import 'package:ecologist_app/roles/driver_role/driver_map_page.dart';
import 'package:ecologist_app/roles/driver_role/driver_orders_page.dart';
import 'package:ecologist_app/roles/driver_role/driver_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:ecologist_app/components/constants.dart';

class DriverMainPage extends StatefulWidget {
  static String id = 'driver_main_page';
  @override
  State<DriverMainPage> createState() => _DriverMainPageState();
}

class _DriverMainPageState extends State<DriverMainPage> {
  int selectedIndex = 0;
  final screens = [
    DriverMapPage(),
    DriverOrdersPage(),
    DriverProfilePage(),
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
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Карта'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Мои заказы'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Профиль')
        ],
      ),
      body: screens[selectedIndex],
    );
  }
}
