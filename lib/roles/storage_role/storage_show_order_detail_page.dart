import 'package:ecologist_app/components/button_1.dart';
import 'package:ecologist_app/components/constants.dart';
import 'package:ecologist_app/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../state/app_state.dart';

class StorageShowOrderDetailPage extends StatelessWidget {
  StorageShowOrderDetailPage(
      {required this.order, required this.buttonText, required this.orderId});

  OrderModel order;
  final String buttonText;
  final String orderId;

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
                  onTap: () {
                    if (order.orderStatus == 'Размещено отправителем') {
                      Provider.of<AppStateManager>(context, listen: false)
                          .changeOrderStatus_Driv_1(orderId);
                      Navigator.pop(context);
                    } else if (order.orderStatus ==
                        'Закреплено за водителем_1') {
                      Provider.of<AppStateManager>(context, listen: false)
                          .changeOrderStatus_AcceptedFromSender(orderId);
                      Navigator.pop(context);
                    } else if (order.orderStatus == 'Принято у отправителя') {
                      Provider.of<AppStateManager>(context, listen: false)
                          .changeOrderStatus_DeliveredToStorage(orderId);
                    } else if (order.orderStatus == 'Доставлено на склад') {
                      Provider.of<AppStateManager>(context, listen: false)
                          .changeOrderStatus_ReadyForShippment(orderId);
                    } else if (order.orderStatus == 'Готово к отгрузке') {
                      Provider.of<AppStateManager>(context, listen: false)
                          .changeOrderStatus_Driv_2(orderId);
                    } else if (order.orderStatus ==
                        'Закреплено за водителем_2') {
                      Provider.of<AppStateManager>(context, listen: false)
                          .changeOrderStatus_Completed(orderId);
                    } else if (order.orderStatus == 'Завершено') {
                      print('Completed');
                    }
                  },
                  child: Text(
                    buttonText,
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
