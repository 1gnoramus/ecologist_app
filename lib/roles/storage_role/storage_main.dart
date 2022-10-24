import 'package:ecologist_app/main_pages/calculation_page.dart';
import 'package:ecologist_app/main_pages/map_page.dart';
import 'package:ecologist_app/main_pages/my_transport_page.dart';
import 'package:ecologist_app/main_pages/report_page.dart';
import 'package:ecologist_app/roles/storage_role/storage_map_page.dart';
import 'package:ecologist_app/roles/storage_role/storage_orders_page.dart';
import 'package:ecologist_app/roles/storage_role/storage_report_page.dart';
import 'package:ecologist_app/roles/storage_role/storage_transp_page.dart';
import 'package:flutter/material.dart';
import 'package:ecologist_app/components/constants.dart';

class StorageMainPage extends StatefulWidget {
  static String id = 'storage_main_page';

  @override
  State<StorageMainPage> createState() => _StorageMainPageState();
}

class _StorageMainPageState extends State<StorageMainPage> {
  int selectedIndex = 0;
  final screens = [
    StorageMapPage(),
    StorageOrdersPage(),
    StorageTranspPage(),
    StorageInfoPage()
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
          BottomNavigationBarItem(
              icon: Icon(Icons.fire_truck), label: 'Мой транспорт'),
          BottomNavigationBarItem(icon: Icon(Icons.report), label: 'Инфо'),
        ],
      ),
      body: screens[selectedIndex],
    );
  }
}
