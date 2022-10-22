import 'package:flutter/material.dart';
import 'package:ecologist_app/components/constants.dart';
import 'package:ecologist_app/components/table_cell.dart';

class DriverOrdersPage extends StatefulWidget {
  @override
  State<DriverOrdersPage> createState() => _DriverOrdersPageState();
}

class _DriverOrdersPageState extends State<DriverOrdersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Transport Page'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      backgroundColor: kMainThemeColor1,
      body: Column(
        children: [
          SizedBox(
            height: 50.0,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Card(
              child: DataTable(
                columns: [
                  DataColumn(
                    label: Text('E-Truck ID'),
                  ),
                  DataColumn(
                    label: Text('From'),
                  ),
                  DataColumn(
                    label: Text('To'),
                  ),
                  DataColumn(
                    label: Text('Data'),
                  ),
                  DataColumn(
                    label: Text('Status'),
                  )
                ],
                rows: [
                  DataRow(
                    cells: [
                      DataCell(
                        TablePiece(
                          text: 'ElectroTruck #1',
                        ),
                      ),
                      DataCell(
                        TablePiece(text: 'Almaty, 3 district'),
                      ),
                      DataCell(
                        TablePiece(text: 'Almaty, Kabanbay Batyr st.'),
                      ),
                      DataCell(
                        TablePiece(text: '24.02.22'),
                      ),
                      DataCell(
                        TablePiece(text: 'Busy'),
                      ),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(
                        TablePiece(
                          text: 'ElectroTruck #2',
                        ),
                      ),
                      DataCell(
                        TablePiece(text: '-'),
                      ),
                      DataCell(
                        TablePiece(text: '-'),
                      ),
                      DataCell(
                        TablePiece(text: '24.02.22'),
                      ),
                      DataCell(
                        TablePiece(text: 'Free'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
