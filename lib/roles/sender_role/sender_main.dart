import 'package:ecologist_app/roles/sender_role/sender_calcul_page.dart';
import 'package:ecologist_app/roles/sender_role/sender_map_page.dart';
import 'package:ecologist_app/roles/sender_role/sender_new_order_page.dart';
import 'package:ecologist_app/roles/sender_role/sender_orders_page.dart';
import 'package:ecologist_app/roles/sender_role/sender_report_page.dart';
import 'package:flutter/material.dart';
import 'package:ecologist_app/components/constants.dart';

class SenderMainPage extends StatefulWidget {
  static String id = 'sender_main_page';

  @override
  State<SenderMainPage> createState() => _SenderMainPageState();
}

class _SenderMainPageState extends State<SenderMainPage> {
  int selectedIndex = 0;
  final screens = [
    SenderMapPage(),
    SenderOrdersPage(),
    SenderCalculPage(),
    SenderNewOrderPage(),
    SenderReportPage(),
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
              icon: Icon(Icons.calculate), label: 'Расчеты'),
          BottomNavigationBarItem(
              icon: Icon(Icons.fast_forward), label: 'Вызвать курьера'),
          BottomNavigationBarItem(icon: Icon(Icons.report), label: 'Отчеты'),
        ],
      ),
      body: screens[selectedIndex],
    );
  }
}
