import 'package:flutter/material.dart';
import 'package:ecologist_app/components/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class SenderMakeOrderPage extends StatefulWidget {
  @override
  State<SenderMakeOrderPage> createState() => _SenderMakeOrderPageState();
}

class _SenderMakeOrderPageState extends State<SenderMakeOrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
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
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                      decoration: BoxDecoration(
                          color: Color(0xFFD0EDF6),
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Truck',
                                  style: GoogleFonts.ubuntu().copyWith(
                                      fontSize: 15.0, color: Colors.black45)),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                '\$7.98 /km',
                                style: GoogleFonts.ubuntu().copyWith(
                                    fontSize: 25.0, color: kFontColor),
                              )
                            ],
                          ),
                          Icon(
                            Icons.fire_truck,
                            size: 100.0,
                            color: Colors.greenAccent,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 45.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Детали заказа',
                      style: GoogleFonts.ubuntu()
                          .copyWith(fontSize: 20.0, color: kFontColor),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15.0, vertical: 10.0),
                              decoration: BoxDecoration(
                                border: BoxBorder.lerp(
                                    Border.all(color: Colors.black45),
                                    Border.all(color: Colors.black45),
                                    15.0),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30.0),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.location_city,
                                    size: 50,
                                    color: Colors.black54,
                                  ),
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Откуда:',
                                          style: GoogleFonts.ubuntu().copyWith(
                                              fontSize: 12.0,
                                              color: Colors.black45)),
                                      SizedBox(
                                        height: 8.0,
                                      ),
                                      Text(
                                        '1 микрорайон, дом 17',
                                        style: GoogleFonts.ubuntu().copyWith(
                                            fontSize: 16.0, color: kFontColor),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15.0, vertical: 10.0),
                              decoration: BoxDecoration(
                                border: BoxBorder.lerp(
                                    Border.all(color: Colors.black45),
                                    Border.all(color: Colors.black45),
                                    15.0),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30.0),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.storage,
                                    size: 50,
                                    color: Colors.black54,
                                  ),
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Куда:',
                                          style: GoogleFonts.ubuntu().copyWith(
                                              fontSize: 12.0,
                                              color: Colors.black45)),
                                      SizedBox(
                                        height: 8.0,
                                      ),
                                      Text(
                                        'ЭКО-склад Алматы',
                                        style: GoogleFonts.ubuntu().copyWith(
                                            fontSize: 16.0, color: kFontColor),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            OrderDetail(
                              icon: Icons.scale,
                              description: 'Вес груза:',
                              hint: 'Введите вес груза',
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OrderDetail extends StatelessWidget {
  const OrderDetail({
    required this.icon,
    required this.description,
    required this.hint,
  });

  final IconData icon;
  final String description;
  final String hint;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      decoration: BoxDecoration(
        border: BoxBorder.lerp(Border.all(color: Colors.black45),
            Border.all(color: Colors.black45), 15.0),
        borderRadius: BorderRadius.all(
          Radius.circular(30.0),
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 50,
            color: Colors.black54,
          ),
          SizedBox(
            width: 20.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('$description',
                  style: GoogleFonts.ubuntu()
                      .copyWith(fontSize: 12.0, color: Colors.black45)),
              SizedBox(
                height: 8.0,
              ),
              Container(
                width: 200.0,
                child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: hint,
                        hintStyle: GoogleFonts.ubuntu()
                            .copyWith(fontSize: 14.0, color: kFontColor)),
                    style: GoogleFonts.ubuntu()
                        .copyWith(fontSize: 16.0, color: kFontColor)),
              ),
              // Text(
              //   '54 кг',
              //   style: GoogleFonts.ubuntu().copyWith(
              //       fontSize: 16.0, color: kFontColor),
              // ),
            ],
          )
        ],
      ),
    );
  }
}
