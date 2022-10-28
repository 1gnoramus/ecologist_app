import 'package:ecologist_app/roles/driver_role/driver_show_order_detail_page%20copy.dart';
import 'package:flutter/material.dart';
import 'package:ecologist_app/components/constants.dart';
import 'package:ecologist_app/components/table_cell.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../models/order_model.dart';
import '../../state/app_state.dart';
import '../sender_role/show_order_detail_page.dart';

class DriverOrdersPage extends StatefulWidget {
  @override
  State<DriverOrdersPage> createState() => _DriverOrdersPageState();
}

class _DriverOrdersPageState extends State<DriverOrdersPage> {
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
                                'Закреплено за водителем_1' ||
                            appStateManager.orders![index].orderStatus ==
                                'Принято у отправителя' ||
                            appStateManager.orders![index].orderStatus ==
                                'Закреплено за водителем_2') {
                          return OrderHistory(
                              order: appStateManager.orders![index]);
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
  OrderHistory({required this.order});

  OrderModel order;

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
                            color: order.orderStatus ==
                                    'Закреплено за водителем_1'
                                ? Colors.red
                                : order.orderStatus == 'Принято у отправителя'
                                    ? Colors.orange
                                    : order.orderStatus == 'Доставлено на склад'
                                        ? Colors.green
                                        : order.orderStatus ==
                                                'Закреплено за водителем_2'
                                            ? Colors.blue
                                            : Colors.black26)),
                    SizedBox(
                      width: 10.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(order.orderId,
                            style: GoogleFonts.ubuntu()
                                .copyWith(fontSize: 14.0, color: kFontColor)),
                        SizedBox(
                          height: 8.0,
                        ),
                        Text(order.orderStatus,
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
                            child: DriverShowOrderDetailPage(order: order)),
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
