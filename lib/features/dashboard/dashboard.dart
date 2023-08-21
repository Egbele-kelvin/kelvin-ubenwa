import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ubenwa_kelvin/constants/color_constants.dart';
import 'package:ubenwa_kelvin/features/dashboard/model/data_class.dart';
import 'package:ubenwa_kelvin/features/widget/custom_alarm_container.dart';
import 'package:ubenwa_kelvin/features/widget/custom_app_bar.dart';
import 'package:ubenwa_kelvin/features/widget/custom_challange_container.dart';
import 'package:ubenwa_kelvin/features/widget/custom_date_container.dart';
import 'package:ubenwa_kelvin/features/widget/custom_overview.dart';

class DashBoardScreen extends StatelessWidget {
  DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BarData myBarData = BarData(
      sunAmount: barchartSumary[0],
      monAmount: barchartSumary[1],
      tueAmount: barchartSumary[2],
      wedAmount: barchartSumary[3],
      thuAmount: barchartSumary[4],
      friAmount: barchartSumary[5],
      satAmount: barchartSumary[6],
      oneAmount: barchartSumary[7],
      twoAmount: barchartSumary[8],
      thrAmount: barchartSumary[9],
      forAmount: barchartSumary[10],
      fivAmount: barchartSumary[11],
      sixAmount: barchartSumary[12],
    );
    myBarData.initializedData();
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.0.w, right: 10.w),
              child: CustomAppBar(),
            ),
            Expanded(flex: 2, child: CustomDateContainer()),
            Padding(
              padding:  EdgeInsets.only(
                left: 15.0.w,  
              ),
              child: Text(
                "Today’s Overview",
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w300,
                  color: kTextGrayColor02,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  CustomOverviewContainer(
                    icon: "assets/images/sun-fog.png",
                    title: "Number of Cry Episode",
                    number: "45",
                    description: "20% better than yesterday",
                    descriptionTextColor: kGreenTextColor,
                    iconContainerColor: Color(0xffD5E0FE),
                  ),
                  CustomOverviewContainer(
                    title: "Longest Cry Duration",
                    description: "20% worst than yesterday",
                    number: "30mins",
                    icon: "assets/images/wifi-square.png",
                    iconContainerColor: Color(0xffFEF5D5),
                    descriptionTextColor: Color(0xffD60F0F),
                  ),
                  CustomOverviewContainer(
                    title: "Cumulative Cry Duration",
                    description: "20% better than yesterday",
                    descriptionTextColor: Color(0xff14833D),
                    number: "4hours",
                    icon: "assets/images/chart.png",
                    iconContainerColor: Color(0xffECD5FE),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Hourly Breakdown",
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w300,
                  color: kTextGrayColor02,
                ),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Expanded(
              flex: 4,
              child: Container(
                  height: 250.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Color(0xff4476F6), Color(0xff07236B)],
                    ),
                  ),
                  child: BarChart(BarChartData(
                      maxY: 100,
                      minY: 0,
                      // backgroundColor: ,
                      gridData: FlGridData(show: false),
                      borderData: FlBorderData(show: false),
                      titlesData: FlTitlesData(
                          show: true,
                          topTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false)),
                          leftTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false)),
                          rightTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false)),
                          bottomTitles: AxisTitles(
                              drawBelowEverything: true,
                              sideTitles: SideTitles(
                                  showTitles: true,
                                  reservedSize: 40,
                                  getTitlesWidget: getBottomTiles))),
                      barGroups: myBarData.barData
                          .map(
                            (data) =>
                                BarChartGroupData(x: data.x, barRods: [
                              BarChartRodData(
                                  toY: data.y,
                                  color: kBarColorWhite,
                                  width: 7.w,
                                  borderRadius: BorderRadius.circular(20),
                                  backDrawRodData:
                                      BackgroundBarChartRodData(
                                          show: true,
                                          toY: 80,
                                          color: kBackDropBarColor
                                              .withOpacity(0.33))),
                            ]),
                          )
                          .toList()))),
            ),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  Expanded(child: CustomChallangeContainer()),

                  SizedBox(
              width: 20.h,
            ),
                  Expanded(
                    child: CustomAlarmContainer(),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getBottomTiles(double value, TitleMeta meta) {
    const style = TextStyle(
        fontWeight: FontWeight.w300, fontSize: 9, color: Colors.white);

    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text(
          "00:00\n02:00",
          style: style,
        );
        break;
      case 1:
        text = const Text(
          "02:00/\n04:00",
          style: style,
        );
        break;
      case 2:
        text = const Text(
          "06:00/\n08:00",
          style: style,
        );
        break;
      case 3:
        text = const Text(
          "08:00/\n10:00",
          style: style,
        );
        break;
      case 4:
        text = const Text(
          "10:00/\n12:00",
          style: style,
        );
        break;
      case 5:
        text = const Text(
          "12:00/\n14:00",
          style: style,
        );
        break;
      case 6:
        text = const Text(
          "14:00/\n16:00",
          style: style,
        );
        break;
      case 7:
        text = const Text(
          "16:00/\n18:00",
          style: style,
        );
        break;
      case 8:
        text = const Text(
          "18:00/\n20:00",
          style: style,
        );
        break;
      case 9:
        text = const Text(
          "20:00/\n22:00",
          style: style,
        );
        break;
      case 10:
        text = const Text(
          "22:00/\n24:00",
          style: style,
        );
        break;
      case 11:
        text = const Text(
          "04:00/\n06:00",
          style: style,
        );
        break;
      default:
        text = const Text(
          " ",
          style: style,
        );
    }

    return SideTitleWidget(child: text, axisSide: meta.axisSide);
  }
}


