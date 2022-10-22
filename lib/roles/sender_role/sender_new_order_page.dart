import 'package:flutter/material.dart';
import 'package:ecologist_app/components/constants.dart';

class SenderNewOrderPage extends StatefulWidget {
  @override
  State<SenderNewOrderPage> createState() => _SenderNewOrderPageState();
}

class _SenderNewOrderPageState extends State<SenderNewOrderPage> {
  Map<String, dynamic> inputData = {};

  late String wasteType;
  late String senderContacts;
  late String uploadTime;
  late String transType;
  bool isUrgent = false;
  late String orderStatus;
  late String sender;
  late String cargoWeight;
  late String address;

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
                          hintText: 'Компания-отправитель',
                          icon: Icons.send_rounded,
                          onTap: (value) {
                            sender = value;
                            inputData['sender'] = sender;
                          },
                        ),
                        OrderTextField(
                          hintText: 'Адрес',
                          icon: Icons.maps_home_work,
                          onTap: (value) {
                            address = value;
                            inputData['address'] = address;
                          },
                        ),
                        OrderTextField(
                          hintText: 'Контакты отправителя',
                          icon: Icons.phone,
                          onTap: (value) {
                            senderContacts = value;
                            inputData['senderContacts'] = senderContacts;
                          },
                        ),
                        OrderTextField(
                          hintText: 'Вес груза',
                          icon: Icons.scale,
                          onTap: (value) {
                            cargoWeight = value;
                            inputData['Тип груза'] = cargoWeight;
                          },
                        ),
                        OrderTextField(
                          hintText: 'Тип груза',
                          icon: Icons.type_specimen,
                          onTap: (value) {
                            wasteType = value;
                            inputData['wasteType'] = wasteType;
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
                                'Погрузочно-разгрузочные работы',
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
                                'Вызвать курьера',
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
