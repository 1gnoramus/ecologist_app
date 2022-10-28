import 'package:flutter/material.dart';
import 'package:ecologist_app/components/constants.dart';
import 'package:ecologist_app/components/table_cell.dart';
import 'package:google_fonts/google_fonts.dart';

class StorageTranspPage extends StatefulWidget {
  @override
  State<StorageTranspPage> createState() => _StorageTranspPageState();
}

class _StorageTranspPageState extends State<StorageTranspPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Мой транспорт'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      backgroundColor: kMainThemeColor1,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(23.0),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Отслеживание Е-траков',
                          style: GoogleFonts.ubuntu()
                              .copyWith(fontSize: 17.0, color: Colors.white)),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                          'Введите трек-номер машины в поисковую строку, чтобы узнать ее статус и информацию',
                          style: GoogleFonts.ubuntu()
                              .copyWith(fontSize: 12.0, color: Colors.white)),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 10.0),
                        width: 300,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.search,
                                color: Colors.blueAccent,
                                size: 30.0,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Container(
                                width: 200,
                                child: TextField(
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Введите трек-номер машины',
                                        hintStyle: GoogleFonts.ubuntu()
                                            .copyWith(
                                                fontSize: 14.0,
                                                color: Colors.black38)),
                                    style: GoogleFonts.ubuntu().copyWith(
                                        fontSize: 16.0, color: kFontColor)),
                              ),
                            ]),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 18.0,
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
                        containerColor: Color.fromARGB(255, 208, 246, 209),
                        transportType: 'Truck (40ft)',
                        cost: '10.11',
                        iconColor: Colors.greenAccent.shade200,
                        onChangedColor: Colors.green,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 18.0,
                ),
                Text('Информация о машинах',
                    style: GoogleFonts.ubuntu()
                        .copyWith(fontSize: 18.0, color: kFontColor)),
                SizedBox(
                  height: 18.0,
                ),
                TransportInfo(
                    transportNum: 'E-truck #003',
                    transportStatus: 'Машина в пути',
                    time: "6ч 30 мин",
                    length: '63 km',
                    transportType: 'Truck (40ft)'),
                TransportInfo(
                    transportNum: 'E-truck #001',
                    transportStatus: 'Свободна',
                    time: "-",
                    length: '-',
                    transportType: 'Truck (10ft)'),
                TransportInfo(
                    transportNum: 'E-truck #002',
                    transportStatus: 'Машина в пути',
                    time: "1ч 37 мин",
                    length: '12 km',
                    transportType: 'Truck (20ft)'),
              ],
            );
          },
        ),
      ),
    );
  }
}

class TransportInfo extends StatelessWidget {
  TransportInfo(
      {required this.transportNum,
      required this.transportStatus,
      required this.time,
      required this.length,
      required this.transportType});

  final String transportNum;
  final String transportType;
  final String transportStatus;
  final String time;
  final String length;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      decoration: BoxDecoration(
          border: BoxBorder.lerp(Border.all(color: Colors.black12),
              Border.all(color: Colors.black12), 15.0),
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      child: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                        backgroundColor: transportType == 'Truck (10ft)'
                            ? Color(0xFFFDF6E4)
                            : transportType == 'Truck (20ft)'
                                ? Color(0xFFD0EDF6)
                                : transportType == 'Truck (40ft)'
                                    ? Color.fromARGB(255, 208, 246, 209)
                                    : Colors.black26,
                        child: Icon(Icons.local_shipping_outlined,
                            size: 30.0,
                            color: transportType == 'Truck (10ft)'
                                ? Colors.redAccent.shade100
                                : transportType == 'Truck (20ft)'
                                    ? Colors.blueAccent.shade100
                                    : transportType == 'Truck (40ft)'
                                        ? Colors.greenAccent.shade200
                                        : Colors.black26)),
                    SizedBox(
                      width: 20.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('$transportNum: $transportStatus',
                            style: GoogleFonts.ubuntu()
                                .copyWith(fontSize: 14.0, color: kFontColor)),
                        SizedBox(
                          height: 8.0,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 100.0,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.linear_scale,
                                    color: Colors.grey,
                                  ),
                                  Text(length,
                                      style: GoogleFonts.ubuntu().copyWith(
                                          fontSize: 14.0, color: kFontColor)),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Container(
                              width: 100.0,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.timer,
                                    color: Colors.grey,
                                  ),
                                  Text(time,
                                      style: GoogleFonts.ubuntu().copyWith(
                                          fontSize: 14.0, color: kFontColor))
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.navigate_next,
                    color: Colors.black87,
                  ),
                )
              ],
            ),
          )
        ],
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
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
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
                        .copyWith(fontSize: 10.0, color: Colors.black45)),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  '\$${widget.cost} /km',
                  style: GoogleFonts.ubuntu()
                      .copyWith(fontSize: 18.0, color: kFontColor),
                )
              ],
            ),
            Icon(
              widget.icon,
              size: 50.0,
              color: widget.iconColor,
            )
          ],
        ),
      ),
    );
  }
}
