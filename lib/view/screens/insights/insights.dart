// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:sizer/sizer.dart';

import 'package:nakdi_pay_user/utils/app_colors.dart';
import 'package:nakdi_pay_user/view/screens/insights/line_chart.dart';

class Insights extends StatefulWidget {
  ScrollController? scroll;

  Insights({
    Key? key,
    required this.scroll,
  }) : super(key: key);

  @override
  State<Insights> createState() => _InsightsState();
}

class _InsightsState extends State<Insights> {
  List<String> accounts = ["cib account", "cib account", "cib account"];
  String _selection = "3 Account";
  bool? active;
  bool? details;
  Map<String, double> dataMap = {
    "EGP 600 CIB Account": 3,
    "EGP 750 CIB Account": 2,
    "EGP 300 CIB Account": 5.5,
  };
  final colorList = <Color>[
    const Color(0xffFF7C7C),
    const Color(0xff6FE79F),
    const Color(0xff7385FF),
    // const Color(0xffe17055),
    // const Color(0xff6c5ce7),
  ];

  List<Map<String, String>> data = [
    {"name": 'Amr', "image": "assets/images/amr.png"},
    {"name": 'Maryam', "image": "assets/images/maryem.png"},
    {"name": 'Abdelrah', "image": "assets/images/abdelrah.png"},
    {"name": 'youssef', "image": "assets/images/youssef.png"},
    {"name": 'Work', "image": "assets/images/work_image.png"},
    {"name": 'Collage', "image": "assets/images/work_image.png"},
    {"name": 'Fatma', "image": "assets/images/fatma.png"}
  ];

  @override
  void initState() {
    active = false;
    details = false;
    super.initState();
  }

  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: widget.scroll,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          color: Color(0xff2B388F),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.36,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              const Text(
                "Your money",
                style: TextStyle(fontSize: 30, color: AppColors.whiteColor),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                  padding: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(
                          20.0)), // decoration: BoxDecoration(border: ),
                  child: PopupMenuButton<String>(
                    itemBuilder: (context) {
                      return accounts.map((str) {
                        return PopupMenuItem(
                          value: str,
                          child: Text(str),
                        );
                      }).toList();
                    },
                    initialValue: _selection,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          _selection,
                          style: const TextStyle(color: AppColors.whiteColor),
                        ),
                        const Icon(
                          Icons.arrow_drop_down,
                          color: AppColors.whiteColor,
                        ),
                      ],
                    ),
                    onSelected: (v) {
                      setState(() {
                        _selection = v;
                      });
                    },
                  )),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        active = false;
                      });
                    },
                    child: Container(
                      decoration: active!
                          ? const BoxDecoration()
                          : BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: AppColors.whiteColor.withOpacity(0.2),
                            ),
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: const [
                          Text(
                            "You have",
                            style: TextStyle(
                                fontSize: 15, color: AppColors.whiteColor),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "EGP 1232",
                            style: TextStyle(
                                fontSize: 20, color: AppColors.whiteColor),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "today",
                            style: TextStyle(
                                fontSize: 15, color: AppColors.whiteColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Container(
                    width: 0.5.w,
                    height: 7.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      color: AppColors.greyColor,
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        active = true;
                      });
                    },
                    child: Container(
                      decoration: active!
                          ? BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: AppColors.whiteColor.withOpacity(0.2),
                            )
                          : const BoxDecoration(),
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: const [
                          Text(
                            "You Spend",
                            style: TextStyle(
                                fontSize: 15, color: AppColors.whiteColor),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "EGP 2485",
                            style: TextStyle(
                                fontSize: 20, color: AppColors.whiteColor),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "since octobar 1st",
                            style: TextStyle(
                                fontSize: 10, color: AppColors.whiteColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: 2.0,
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: details!
              ? InkWell(
                  onTap: (() {
                    setState(() {
                      details = !details!;
                    });
                  }),
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "back ->",
                      style: TextStyle(
                          fontFamily: "Inter-Regular",
                          fontSize: 10.sp,
                          color: AppColors.primaryColor),
                    ),
                  ),
                )
              : Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                          color:
                              active! ? AppColors.blueColor : Color(0xff30B078),
                          borderRadius: BorderRadius.circular(50.0)),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      active! ? "Spend" : "Income",
                      style: TextStyle(
                        fontFamily: "Inter-Regular",
                        fontSize: 10.sp,
                        color:
                            active! ? AppColors.blueColor : Color(0xff30B078),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.60,
                    ),
                    InkWell(
                      onTap: (() {
                        setState(() {
                          details = !details!;
                        });
                      }),
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.blueColor),
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Text(
                          "Details",
                          style: TextStyle(
                              fontFamily: "Inter-Regular",
                              fontSize: 10.sp,
                              color: AppColors.primaryColor),
                        ),
                      ),
                    )
                  ],
                ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        details!
            ? Container()
            : PieChart(
                dataMap: dataMap,
                animationDuration: Duration(milliseconds: 800),
                chartLegendSpacing: 10.w,
                chartRadius: MediaQuery.of(context).size.width / 3.2,
                colorList: colorList,
                initialAngleInDegree: 0,
                centerText: active! ? "Spend" : "Have",
                chartType: ChartType.ring,
                ringStrokeWidth: 15,
                legendOptions: LegendOptions(
                  showLegendsInRow: false,
                  legendPosition: LegendPosition.right,
                  showLegends: true,
                  // legendShape: _BoxShape.circle,
                  legendTextStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                chartValuesOptions: ChartValuesOptions(
                  showChartValueBackground: true,
                  showChartValues: true,
                  showChartValuesInPercentage: true,
                  showChartValuesOutside: true,
                  decimalPlaces: 1,
                ),
                // gradientList: ---To add gradient colors---
                // emptyColorGradient: ---Empty Color gradient---
              ),
        const SizedBox(
          height: 15.0,
        ),
        details!
            ? Padding(
                padding: const EdgeInsets.all(10.0),
                child: LineChartSample2(
                  lineColor1: gradientColors[0],
                  lineColor2: gradientColors[1],
                ),
              )
            : Container(),
        const SizedBox(
          height: 15.0,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 15.0),
          child: Text(
            "Recent Transactions ",
            style: TextStyle(fontSize: 20, color: AppColors.blackColor),
          ),
        ),
        const SizedBox(
          height: 15.0,
        ),
        ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: data.length,
            padding: EdgeInsets.zero,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: ListTile(
                    leading: Image.asset(data[index]["image"]!),
                    trailing: Text(
                      "+ EGP 124",
                      style: TextStyle(
                          color: Colors.greenAccent[400], fontSize: 15),
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data[index]["name"]!,
                          style: const TextStyle(
                              fontSize: 20, color: AppColors.blackColor),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          "03:12  May 18  CIB account",
                          style: TextStyle(
                              fontSize: 10, color: AppColors.greyColor),
                        ),
                      ],
                    )),
              );
            }),
      ]),
    );
  }
}
