import 'package:flutter/material.dart';

import '../components/constants.dart';

class CalculationPage extends StatefulWidget {
  @override
  State<CalculationPage> createState() => _CalculationPageState();
}

class _CalculationPageState extends State<CalculationPage> {
  Map<String, dynamic> inputData = {};

  late String uploadPlace;
  late String downloadPlace;
  late String uploadTime;
  late String transType;
  bool isUrgent = false;
  late String orderStatus;
  late String cargoType;
  late String cargoWeight;
  late String cargoVolume;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculation Page'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      backgroundColor: kMainThemeColor1,
      body: Center(
        child: Container(
          padding: EdgeInsets.all(10.0),
          margin: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        OrderTextField(
                          hintText: 'Тип груза',
                          icon: Icons.add_box,
                          onTap: (value) {
                            cargoType = value;
                            inputData['cargoType'] = cargoType;
                          },
                        ),
                        OrderTextField(
                          hintText: 'Объем груза',
                          icon: Icons.volume_down,
                          onTap: (value) {
                            cargoVolume = value;
                            inputData['cargoVolume'] = cargoVolume;
                          },
                        ),
                        OrderTextField(
                          hintText: 'Вес груза',
                          icon: Icons.line_weight,
                          onTap: (value) {
                            cargoWeight = value;
                            inputData['cargoWeight'] = cargoWeight;
                          },
                        ),
                        OrderTextField(
                          hintText: 'Место отгрузки',
                          icon: Icons.upload,
                          onTap: (value) {
                            uploadPlace = value;
                            inputData['uploadPlace'] = uploadPlace;
                          },
                        ),
                        OrderTextField(
                          hintText: 'Место выгрузки',
                          icon: Icons.download,
                          onTap: (value) {
                            downloadPlace = value;
                            inputData['downloadPlace'] = downloadPlace;
                          },
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (isUrgent == false) {
                                isUrgent = true;
                              } else {
                                isUrgent = false;
                              }
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                isUrgent ? Icons.check_box : Icons.square,
                                color: Colors.deepOrange,
                                size: 30.0,
                              ),
                              Text(
                                'Мультимодальная перевозка',
                                style: TextStyle(
                                    color: Colors.black45,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context, inputData);
                            inputData['isUrgent'] = isUrgent;
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: kElementsColor,
                                borderRadius: BorderRadius.circular(10.0)),
                            width: 280.0,
                            height: 40.0,
                            margin: EdgeInsets.all(10.0),
                            child: Center(
                              child: Text(
                                'Рассчитать маршрут',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OrderTextField extends StatelessWidget {
  OrderTextField(
      {required this.hintText, required this.icon, required this.onTap});

  final String hintText;
  final IconData icon;
  Function onTap;

  TextEditingController orderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        controller: orderController,
        style: TextStyle(
          color: Colors.black,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          icon: Icon(
            icon,
            color: Colors.black,
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide.none,
          ),
        ),
        onChanged: (value) {
          value.toString();
          onTap(value);
        },
      ),
    );
  }
}
