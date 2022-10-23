import 'package:ecologist_app/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SenderCalculPage extends StatefulWidget {
  // OrderReceivePage({required this.order});
  // OrderModel order;

  @override
  State<SenderCalculPage> createState() => _SenderCalculPageState();
}

class _SenderCalculPageState extends State<SenderCalculPage> {
  DropdownButton<String> androidDropdown(dropList) {
    String? facilityName = dropList[0];
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String dropItem in dropList) {
      var newItem = DropdownMenuItem(
        child: Text(
          dropItem,
          style: TextStyle(fontSize: 15.0, color: kFontColor),
        ),
        value: dropItem,
      );
      dropdownItems.add(newItem);
    }

    return DropdownButton<String>(
      dropdownColor: kElementsColor,
      value: facilityName,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          facilityName = value;
        });
      },
    );
  }

  bool manually = true;
  bool byWeighing = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "Расчеты",
          style: TextStyle(fontSize: 20.0),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Информация о заявке:",
                  style: TextStyle(fontSize: 20.0, color: Colors.black),
                ),
                Container(
                  margin: EdgeInsets.all(10.0),
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: Colors.green.shade800,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    decoration: const BoxDecoration(
                      color: kElementsColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    child: const Text(
                      "Дата передачи/Date of removal:  "
                      "\nОбъект откуда вывозят отходы:  "
                      "\nОбъект куда вывозят отходы:  "
                      "\nКомпания вывозящая отходы:  "
                      "\nДанные по машине "
                      "\nАгрегатное состояние"
                      "\nНаименование отхода"
                      "\n Плотность ",
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 15.0, color: Colors.black),
                    ),
                  ),
                ),
                const Text(
                  'Способы расчета',
                  style: TextStyle(fontSize: 20.0, color: Colors.black),
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              if (manually == false) {
                                manually = true;
                                byWeighing == false;
                              } else {
                                manually = false;
                                byWeighing = true;
                              }
                            });
                          },
                          icon: Icon(
                            manually ? Icons.check_box : Icons.square,
                            color: Colors.lightGreenAccent,
                            size: 30.0,
                          ),
                        ),
                        Text(
                          'Ручное',
                          style: TextStyle(fontSize: 18.0, color: Colors.black),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              if (byWeighing == false) {
                                byWeighing = true;
                                manually = false;
                              } else {
                                byWeighing = false;
                                manually = true;
                              }
                            });
                          },
                          icon: Icon(
                            byWeighing ? Icons.check_box : Icons.square,
                            color: Colors.lightGreenAccent,
                            size: 30.0,
                          ),
                        ),
                        const Text(
                          'Путем взвешивания',
                          style: TextStyle(fontSize: 18.0, color: Colors.black),
                        )
                      ],
                    ),
                  ],
                ),
                manually ? ManualCalculator() : ByWeighingCalculator()
              ],
            ),
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 3.0),
                decoration: const BoxDecoration(
                  color: kElementsColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
                child: TextButton(
                  onPressed: () {
                    //добавляет заказ на сервер (главную страницу)
                  },
                  child: const Text(
                    'Рассчитать',
                    style: TextStyle(fontSize: 15.0, color: kFontColor),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ManualCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      hintText: 'тонн',
                      hintStyle: TextStyle(color: Colors.black54),
                      filled: true,
                      fillColor: Colors.white60,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onChanged: (value) {},
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Expanded(
                  child: TextField(
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      hintText: 'штук',
                      hintStyle: TextStyle(color: Colors.black54),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onChanged: (value) {},
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Expanded(
                  child: TextField(
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      hintText: 'м3',
                      hintStyle: TextStyle(color: Colors.black54),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            'Формула',
            style: TextStyle(fontSize: 20.0, color: Colors.black),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            child: Text('E = mc2',
                style: TextStyle(fontSize: 20.0, color: Colors.black)),
          )
        ],
      ),
    );
  }
}

class ByWeighingCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'Количество отходов',
                        style: TextStyle(color: Colors.white, fontSize: 15.0),
                      ),
                      TextField(
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          hintText: 'тонн',
                          hintStyle: TextStyle(color: Colors.black54),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        onChanged: (value) {},
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        '№ операции',
                        style: TextStyle(color: Colors.white, fontSize: 15.0),
                      ),
                      TextField(
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          hintText: '№',
                          hintStyle: TextStyle(color: Colors.black54),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        onChanged: (value) {},
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
