import 'package:ecologist_app/components/button_1.dart';
import 'package:ecologist_app/components/constants.dart';
import 'package:ecologist_app/models/order_model.dart';
import 'package:ecologist_app/roles/driver_role/order_QR.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../state/app_state.dart';

class DriverShowOrderDetailPage extends StatelessWidget {
  DriverShowOrderDetailPage({
    required this.order,
  });

  OrderModel order;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Заявка ${order.orderId}",
              textAlign: TextAlign.center,
              style: GoogleFonts.ubuntu()
                  .copyWith(fontSize: 20.0, color: Colors.black54),
            ),
            Text(
              'Информация о заявке',
              textAlign: TextAlign.center,
              style: GoogleFonts.ubuntu()
                  .copyWith(fontSize: 20.0, color: Colors.black54),
            ),
            SizedBox(
              height: 5.0,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      "Дата передачи/Date of removal: 27.10.2022"
                      "\nОткуда вывозят отходы: ${order.senderCompanyName}"
                      "\nКуда вывозят отходы: ${order.storageName}"
                      "\nДанные по машине: ${order.transpType}"
                      "\nНаименование отхода: ${order.wasteType}"
                      "\nКонтакты отправителя: +7 778 057 6672",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.ubuntu()
                          .copyWith(fontSize: 15.0, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20.0, top: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                color: Colors.black87,
              ),
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 50.0),
              child: Center(
                child: GestureDetector(
                  onTap: () async {
                    if (order.orderStatus == 'Закреплено за водителем_1') {
                      print('object');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrderQRPage(order: order),
                        ),
                      );
                    } else if (order.orderStatus == 'Принято у отправителя') {
                      Navigator.pop(context);
                    } else if (order.orderStatus == 'Доставлено на склад') {
                      Navigator.pop(context);
                    } else if (order.orderStatus ==
                        'Закреплено за водителем_2') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrderQRPage(
                            order: order,
                          ),
                        ),
                      );
                    } else if (order.orderStatus == 'Завершено') {
                      Navigator.pop(context);
                    }
                  },
                  child: Text(
                    order.orderStatus == 'Закреплено за водителем_1'
                        ? 'Отсканировать код'
                        : order.orderStatus == 'Принято у отправителя'
                            ? 'Закрыть'
                            : order.orderStatus == 'Доставлено на склад'
                                ? 'Закрыть'
                                : order.orderStatus ==
                                        'Закреплено за водителем_2'
                                    ? 'Отсканировать код'
                                    : order.orderStatus == 'Завершено'
                                        ? 'Добавить в отчет'
                                        : '???',
                    style: GoogleFonts.ubuntu().copyWith(
                      fontSize: 14.0,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
