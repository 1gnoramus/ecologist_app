import 'package:ecologist_app/roles/sender_role/show_order_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:ecologist_app/components/constants.dart';
import 'package:ecologist_app/components/table_cell.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../state/app_state.dart';
import '../driver_role/driver_show_order_detail_page copy.dart';

class SenderOrdersPage extends StatefulWidget {
  @override
  State<SenderOrdersPage> createState() => _SenderOrdersPageState();
}

class _SenderOrdersPageState extends State<SenderOrdersPage> {
  void getOrders() async {
    await Provider.of<AppStateManager>(context, listen: false)
        .getDriverOrders();
  }

  @override
  void initState() {
    getOrders();
    super.initState();
  }

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
      body: Consumer<AppStateManager>(
        builder: (BuildContext context, AppStateManager appStateManager,
            Widget? child) {
          if (appStateManager.orders != null) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(23.0),
                    decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Отследите свой заказ',
                            style: GoogleFonts.ubuntu().copyWith(
                                fontSize: 17.0, color: Colors.black45)),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                            'Введите номер заказа в поисковую строку, чтобы узнать его статус',
                            style: GoogleFonts.ubuntu().copyWith(
                                fontSize: 12.0, color: Colors.black45)),
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 10.0),
                          width: 300,
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.search,
                                  color: Colors.greenAccent,
                                  size: 30.0,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Container(
                                  width: 200,
                                  child: TextField(
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'Введите номер заказа',
                                          hintStyle: GoogleFonts.ubuntu()
                                              .copyWith(
                                                  fontSize: 14.0,
                                                  color: Colors.black38)),
                                      style: GoogleFonts.ubuntu().copyWith(
                                          fontSize: 16.0, color: kFontColor)),
                                ),
                              ]),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 35.0,
                  ),
                  Text('История заявок',
                      style: GoogleFonts.ubuntu()
                          .copyWith(fontSize: 25.0, color: kFontColor)),
                  SizedBox(
                    height: 35.0,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: appStateManager.orders!.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (appStateManager.orders![index].orderStatus ==
                                'Размещено отправителем' ||
                            appStateManager.orders![index].orderStatus ==
                                'Закреплено за водителем_1' ||
                            appStateManager.orders![index].orderStatus ==
                                'Принято у отправителя' ||
                            appStateManager.orders![index].orderStatus ==
                                'Доставлено на склад') {
                          return OrderHistory(
                              senderCompanyName: appStateManager
                                  .orders![index].senderCompanyName,
                              storageName:
                                  appStateManager.orders![index].storageName,
                              wasteType:
                                  appStateManager.orders![index].wasteType,
                              cargoWeight:
                                  appStateManager.orders![index].cargoWeight,
                              orderId: appStateManager.orders![index].orderId,
                              transpType:
                                  appStateManager.orders![index].transpType,
                              shippingCost:
                                  appStateManager.orders![index].shippingCost,
                              orderStatus:
                                  appStateManager.orders![index].orderStatus);
                        }

                        return Center(child: Container());
                      },
                    ),
                  ),
                ],
              ),
            );
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}

class OrderHistory extends StatelessWidget {
  OrderHistory(
      {required this.senderCompanyName,
      required this.storageName,
      required this.wasteType,
      required this.cargoWeight,
      required this.orderId,
      required this.transpType,
      required this.shippingCost,
      required this.orderStatus});

  final String senderCompanyName;
  final String storageName;
  final String wasteType;
  final String cargoWeight;
  final String orderId;
  final String transpType;
  final String orderStatus;
  final String shippingCost;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      decoration: BoxDecoration(
          border: BoxBorder.lerp(Border.all(color: Colors.black12),
              Border.all(color: Colors.black12), 15.0),
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      child: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                        backgroundColor: Color(0xFFFDF6E4),
                        child: Icon(Icons.local_shipping_outlined,
                            color: orderStatus == 'Размещено отправителем'
                                ? Colors.red
                                : orderStatus == 'Закреплено за водителем_1'
                                    ? Colors.orange
                                    : orderStatus == 'Принято у отправителя'
                                        ? Colors.yellow
                                        : orderStatus == 'Доставлено на склад'
                                            ? Colors.green
                                            : Colors.black26)),
                    SizedBox(
                      width: 10.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(orderId,
                            style: GoogleFonts.ubuntu()
                                .copyWith(fontSize: 14.0, color: kFontColor)),
                        SizedBox(
                          height: 8.0,
                        ),
                        Text(orderStatus,
                            style: GoogleFonts.ubuntu()
                                .copyWith(fontSize: 12.0, color: Colors.grey))
                      ],
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => SingleChildScrollView(
                        child: Container(
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom),
                            child: SenderShowOrderDetailPage(
                                senderCompanyName: senderCompanyName,
                                storageName: storageName,
                                wasteType: wasteType,
                                cargoWeight: cargoWeight,
                                orderId: orderId,
                                transpType: transpType,
                                shippingCost: shippingCost,
                                orderStatus: orderStatus)),
                      ),
                    );
                  },
                  child: Icon(
                    Icons.navigate_next,
                    color: Colors.black87,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
