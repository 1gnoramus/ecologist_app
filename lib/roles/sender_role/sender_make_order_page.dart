// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecologist_app/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:ecologist_app/components/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../state/app_state.dart';

class SenderMakeOrderPage extends StatefulWidget {
  @override
  State<SenderMakeOrderPage> createState() => _SenderMakeOrderPageState();
}

class _SenderMakeOrderPageState extends State<SenderMakeOrderPage> {
  late String senderCompanyName;
  late String storageName;
  late String wasteType;
  late String cargoWeight;
  late String orderId;
  late String transpType;
  String shippingCost = '\$10,99';
  late String orderStatus;

  Map<String, dynamic> inputData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Consumer<AppStateManager>(
        builder: (BuildContext context, AppStateManager appStateManager,
            Widget? child) {
          if (appStateManager.orders == null) {
            return Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 40.0,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 45.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Транспорт',
                          style: GoogleFonts.ubuntu()
                              .copyWith(fontSize: 20.0, color: kFontColor),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              TransportDetail(
                                icon: Icons.fire_truck_rounded,
                                containerColor: Color(0xFFFDF6E4),
                                transportType: 'Truck (10ft)',
                                cost: '5.45',
                                iconColor: Colors.redAccent.shade100,
                                onChangedColor: Colors.red,
                              ),
                              TransportDetail(
                                icon: Icons.fire_truck_outlined,
                                containerColor: Color(0xFFD0EDF6),
                                transportType: 'Truck (20ft)',
                                cost: '7.98',
                                iconColor: Colors.blueAccent.shade100,
                                onChangedColor: Colors.blue,
                              ),
                              TransportDetail(
                                icon: Icons.fire_truck_sharp,
                                containerColor:
                                    Color.fromARGB(255, 208, 246, 209),
                                transportType: 'Truck (40ft)',
                                cost: '10.11',
                                iconColor: Colors.greenAccent.shade200,
                                onChangedColor: Colors.green,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 45.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Детали заказа',
                            style: GoogleFonts.ubuntu()
                                .copyWith(fontSize: 15.0, color: kFontColor),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                return Column(
                                  children: [
                                    OrderDetail(
                                      icon: Icons.location_city,
                                      description: 'Откуда:',
                                      hint: 'Компания-отправитель',
                                      onTap: (value) {
                                        senderCompanyName = value;
                                        inputData['senderCompanyName'] =
                                            senderCompanyName;
                                      },
                                    ),
                                    OrderDetail(
                                      icon: Icons.storage,
                                      description: 'Куда:',
                                      hint: 'Введите название склада',
                                      onTap: (value) {
                                        storageName = value;
                                        inputData['storageName'] = storageName;
                                      },
                                    ),
                                    OrderDetail(
                                      icon: Icons.eco,
                                      description: 'Тип отходов:',
                                      hint: 'Выберите тип отходов',
                                      onTap: (value) {
                                        wasteType = value;
                                        inputData['wasteType'] = wasteType;
                                      },
                                    ),
                                    OrderDetail(
                                      icon: Icons.scale,
                                      description: 'Вес груза:',
                                      hint: 'Введите вес груза',
                                      onTap: (value) {
                                        cargoWeight = value;
                                        inputData['cargoWeight'] = cargoWeight;
                                      },
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 10.0, top: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Итого:',
                                  style: GoogleFonts.ubuntu().copyWith(
                                      fontSize: 13.0, color: Colors.black54),
                                ),
                                Text(shippingCost,
                                    style: GoogleFonts.ubuntu().copyWith(
                                      fontSize: 14.0,
                                      color: Colors.black87,
                                    ))
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0)),
                                  border: BoxBorder.lerp(
                                      Border.all(color: Colors.black45),
                                      Border.all(color: Colors.black45),
                                      15.0),
                                ),
                                alignment: Alignment.center,
                                margin:
                                    EdgeInsets.only(bottom: 20.0, top: 10.0),
                                child: Center(
                                  child: GestureDetector(
                                    child: Icon(
                                      Icons.close,
                                      size: 20.0,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin:
                                    EdgeInsets.only(bottom: 20.0, top: 10.0),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0)),
                                  color: Colors.black87,
                                ),
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 50.0),
                                child: GestureDetector(
                                  onTap: () async {
                                    await Provider.of<AppStateManager>(context,
                                            listen: false)
                                        .placeNewOrder(OrderModel(
                                            senderCompanyName:
                                                senderCompanyName,
                                            storageName: storageName,
                                            wasteType: wasteType,
                                            cargoWeight: cargoWeight,
                                            orderId: 'orderId',
                                            transpType: 'Truck',
                                            shippingCost: shippingCost,
                                            orderStatus:
                                                'Размещено отправителем'));
                                  },
                                  child: Text(
                                    'Отправить запрос',
                                    style: GoogleFonts.ubuntu().copyWith(
                                      fontSize: 14.0,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(
              color: Colors.greenAccent,
            ),
          );
        },
      ),
    );
  }
}

class TransportDetail extends StatefulWidget {
  const TransportDetail(
      {required this.transportType,
      required this.icon,
      required this.cost,
      required this.containerColor,
      required this.iconColor,
      required this.onChangedColor});

  final String transportType;
  final IconData icon;
  final String cost;
  final Color containerColor;
  final Color iconColor;
  final Color onChangedColor;

  @override
  State<TransportDetail> createState() => _TransportDetailState();
}

class _TransportDetailState extends State<TransportDetail> {
  bool isChosen = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('$isChosen');
        setState(() {
          if (isChosen) {
            isChosen = false;
          } else {
            isChosen = true;
          }
          ;
        });
        print('$isChosen');
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
        decoration: BoxDecoration(
            color: isChosen ? widget.onChangedColor : widget.containerColor,
            // Color(0xFFD0EDF6),
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.transportType,
                    style: GoogleFonts.ubuntu()
                        .copyWith(fontSize: 13.0, color: Colors.black45)),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  '\$${widget.cost} /km',
                  style: GoogleFonts.ubuntu()
                      .copyWith(fontSize: 20.0, color: kFontColor),
                )
              ],
            ),
            Icon(
              widget.icon,
              size: 100.0,
              color: widget.iconColor,
            )
          ],
        ),
      ),
    );
  }
}

class OrderDetail extends StatelessWidget {
  OrderDetail(
      {required this.icon,
      required this.description,
      required this.hint,
      required this.onTap});

  final IconData icon;
  final String description;
  final String hint;
  Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      decoration: BoxDecoration(
        border: BoxBorder.lerp(Border.all(color: Colors.black45),
            Border.all(color: Colors.black45), 15.0),
        borderRadius: BorderRadius.all(
          Radius.circular(30.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 40,
            color: Colors.black54,
          ),
          SizedBox(
            width: 10.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('$description',
                  style: GoogleFonts.ubuntu()
                      .copyWith(fontSize: 12.0, color: Colors.black45)),
              SizedBox(
                height: 5.0,
              ),
              Container(
                height: 15.0,
                width: 200.0,
                child: TextField(
                    onChanged: (value) {
                      value.toString();
                      onTap(value);
                    },
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: hint,
                        hintStyle: GoogleFonts.ubuntu()
                            .copyWith(fontSize: 12.0, color: Colors.black38)),
                    style: GoogleFonts.ubuntu()
                        .copyWith(fontSize: 16.0, color: kFontColor)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
