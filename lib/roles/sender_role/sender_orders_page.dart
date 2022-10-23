import 'package:ecologist_app/roles/sender_role/sender_show_order_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:ecologist_app/components/constants.dart';
import 'package:ecologist_app/components/table_cell.dart';
import 'package:google_fonts/google_fonts.dart';

class SenderOrdersPage extends StatefulWidget {
  @override
  State<SenderOrdersPage> createState() => _SenderOrdersPageState();
}

class _SenderOrdersPageState extends State<SenderOrdersPage> {
  String orderNum_1 = '#001';
  String data_1 = '12.02.2022';
  String sender_1 = 'Компания Стекло';
  String receiver_1 = 'ЭКО-склад Алматы';
  String transportInfo_1 = 'Машина №1231';
  String wasteType_1 = 'Стекло';
  String senderContacts_1 = '+77023315745';

  String orderNum_2 = '#002';
  String data_2 = '24.05.2022';
  String sender_2 = 'Компания ГофроКартон';
  String receiver_2 = 'ЭКО-склад Алматы';
  String transportInfo_2 = 'Машина №2331';
  String wasteType_2 = 'Гофрокартон';
  String senderContacts_2 = '+77023315745';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Мои заказы'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      backgroundColor: kMainThemeColor1,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50.0,
            ),
            Text(
              'Мои заказы',
              style: GoogleFonts.ubuntu()
                  .copyWith(fontSize: 20.0, color: kFontColor),
            ),
            SizedBox(
              height: 20.0,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Card(
                child: DataTable(
                  horizontalMargin: 15.0,
                  columnSpacing: 20.0,
                  border: TableBorder.all(color: Colors.black54),
                  dataRowColor:
                      MaterialStateColor.resolveWith((states) => Colors.white),
                  headingRowColor:
                      MaterialStateColor.resolveWith((states) => Colors.white),
                  columns: [
                    DataColumn(
                      label: Text(
                        'Номер',
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Адрес',
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Статус',
                        style: TextStyle(color: Colors.black54),
                      ),
                    )
                  ],
                  rows: [
                    DataRow(
                      cells: [
                        DataCell(
                          GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) => SingleChildScrollView(
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          bottom: MediaQuery.of(context)
                                              .viewInsets
                                              .bottom),
                                      child: SenderShowOrderDetailPage(
                                          orderNum: orderNum_1,
                                          data: data_1,
                                          sender: sender_1,
                                          receiver: receiver_1,
                                          transportInfo: transportInfo_1,
                                          wasteType: wasteType_1,
                                          senderContacts: senderContacts_1),
                                    ),
                                  ),
                                );
                              },
                              child: Text(
                                '$orderNum_1',
                                style: TextStyle(color: Colors.black54),
                              )),
                        ),
                        DataCell(
                          TablePiece(text: 'ул. Навои 36'),
                        ),
                        DataCell(
                          TablePiece(text: 'Размещено'),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) => SingleChildScrollView(
                                    child: Container(
                                        padding: EdgeInsets.only(
                                            bottom: MediaQuery.of(context)
                                                .viewInsets
                                                .bottom),
                                        child: SenderShowOrderDetailPage(
                                            orderNum: orderNum_2,
                                            data: data_2,
                                            sender: sender_2,
                                            receiver: receiver_2,
                                            transportInfo: transportInfo_2,
                                            wasteType: wasteType_2,
                                            senderContacts: senderContacts_2)),
                                  ),
                                );
                              },
                              child: Text(
                                '$orderNum_2',
                                style: TextStyle(color: Colors.black54),
                              )),
                        ),
                        DataCell(
                          TablePiece(text: '2 district'),
                        ),
                        DataCell(
                          TablePiece(text: 'Размещено'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
