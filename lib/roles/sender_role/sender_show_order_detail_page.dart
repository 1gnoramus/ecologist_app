import 'package:ecologist_app/components/button_1.dart';
import 'package:ecologist_app/components/constants.dart';
import 'package:flutter/material.dart';

class SenderShowOrderDetailPage extends StatelessWidget {
  SenderShowOrderDetailPage(
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
              height: 15.0,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      "Дата передачи/Date of removal: $data"
                      '\n'
                      "\nОткуда вывозят отходы: $sender"
                      '\n'
                      "\nКуда вывозят отходы: $receiver"
                      '\n'
                      "\nДанные по машине: $transportInfo"
                      '\n'
                      "\nНаименование отхода: $wasteType"
                      '\n'
                      "\nКонтакты отправителя: $senderContacts"
                      '\n',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 15.0, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            Button_1(
              textColor: kFontColor,
              onTap: () {
                Navigator.pop;
              },
              color: kElementsColor,
              buttonText: 'Выдать',
            )
          ],
        ),
      ),
    );
  }
}
