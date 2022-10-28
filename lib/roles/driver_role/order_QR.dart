import 'package:ecologist_app/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../models/order_model.dart';
import '../../state/app_state.dart';

class OrderQRPage extends StatefulWidget {
  OrderQRPage({required this.order});
  OrderModel order;

  @override
  State<OrderQRPage> createState() => _OrderQRPageState();
}

class _OrderQRPageState extends State<OrderQRPage> {
  String? qrData = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Заявка №${widget.order.orderId}',
              style: GoogleFonts.ubuntu()
                  .copyWith(fontSize: 25.0, color: Colors.black87),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text(
                  'Отсканируйте этот QR - код при въезде на КПП:',
                  style: TextStyle(fontSize: 15.0, color: Colors.black54),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Icon(
                  Icons.qr_code_2,
                  color: Colors.black54,
                  size: 300,
                ),
                SizedBox(
                  height: 30.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 20.0, top: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        color: Colors.black87,
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 50.0),
                      child: GestureDetector(
                        onTap: () {
                          if (widget.order.orderStatus ==
                              'Закреплено за водителем_1') {
                            Provider.of<AppStateManager>(context, listen: false)
                                .changeOrderStatus_AcceptedFromSender(
                                    widget.order.documentId);
                            Navigator.pop(context);
                          } else if (widget.order.orderStatus ==
                              'Закреплено за водителем_2') {
                            Provider.of<AppStateManager>(context, listen: false)
                                .changeOrderStatus_Completed(
                                    widget.order.documentId);
                            Navigator.pop(context);
                          }
                        },
                        child: Text('Код отсканирован',
                            style: GoogleFonts.ubuntu().copyWith(
                              fontSize: 16.0,
                              color: Colors.grey,
                            )),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
