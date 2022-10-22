import 'package:ecologist_app/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class OrderQRPage extends StatefulWidget {
  // OrderQRPage({required this.order});
  // OrderModel order;

  @override
  State<OrderQRPage> createState() => _OrderQRPageState();
}

class _OrderQRPageState extends State<OrderQRPage> {
  String? qrData = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(
              height: 20.0,
            ),
            Text(
              'Отсканируйте этот QR - код при въезде на КПП:',
              style: TextStyle(fontSize: 15.0, color: Colors.black54),
            ),
            SizedBox(
              height: 40.0,
            ),
            Icon(
              Icons.qr_code_2,
              color: Colors.black54,
              size: 300,
            ),
            // qrData == null
            //     ? CircularProgressIndicator()
            //     : Expanded(
            //         child: QrImage(data: qrData!),
            //       ),
            SizedBox(
              height: 50.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text('Номер заявки: #${widget.order.id}',
                //     style: TextStyle(fontSize: 15.0, color: kMainThemeColor3)),
                Container(
                  decoration: BoxDecoration(
                    color: kElementsColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Принять заявку',
                      style: TextStyle(fontSize: 15.0, color: kFontColor),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
