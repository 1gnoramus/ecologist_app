import 'package:ecologist_app/components/button_1.dart';
import 'package:ecologist_app/components/constants.dart';
import 'package:flutter/material.dart';

class ShowOrderDetailPage extends StatelessWidget {
  ShowOrderDetailPage(
      {required this.orderNum,
      required this.data,
      required this.sender,
      required this.receiver,
      required this.transportInfo,
      required this.wasteType,
      required this.senderContacts});
  late String orderNum;
  late String data;
  late String sender;
  late String receiver;
  late String transportInfo;
  late String wasteType;
  late String senderContacts;

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
              "Заявка $orderNum",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20.0, color: Colors.black54),
            ),
            Text(
              'Информация о заявке',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20.0, color: Colors.black54),
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
                      "Дата передачи/Date of removal: $data"
                      "\nОткуда вывозят отходы: $sender"
                      "\nКуда вывозят отходы: $receiver"
                      "\nДанные по машине: $transportInfo"
                      "\nНаименование отхода: $wasteType"
                      "\nКонтакты отправителя: $senderContacts",
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 15.0, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            Button_1(
              textColor: kFontColor,
              onTap: () {},
              color: kElementsColor,
              buttonText: 'Выдать курьеру',
            )
          ],
        ),
      ),
    );
  }
}
