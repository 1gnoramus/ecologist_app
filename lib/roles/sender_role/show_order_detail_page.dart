import 'package:ecologist_app/components/button_1.dart';
import 'package:ecologist_app/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowOrderDetailPage extends StatelessWidget {
  ShowOrderDetailPage(
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
              "Заявка $orderId",
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
                      "\nОткуда вывозят отходы: $senderCompanyName"
                      "\nКуда вывозят отходы: $storageName"
                      "\nДанные по машине: $transpType"
                      "\nНаименование отхода: $wasteType"
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
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Закрыть',
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
