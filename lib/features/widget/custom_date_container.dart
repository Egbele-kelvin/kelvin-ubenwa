// ignore_for_file: unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ubenwa_kelvin/constants/color_constants.dart';

class CustomDateContainer extends StatefulWidget {
  CustomDateContainer({
    super.key,
  });

  @override
  State<CustomDateContainer> createState() => _CustomDateContainerState();
}

class _CustomDateContainerState extends State<CustomDateContainer> {
  final List<String> months = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];
  final List<String> days = [
    "Sat",
    "Sun",
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
  ];
  final List<String> numbers = [
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
  ];
  int selectedIdx = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 25.h,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: NeverScrollableScrollPhysics(),
              itemCount: months.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 9.0, right: 9),
                  child: Text(
                    months[index],
                    style: yourTextStyle.copyWith(
                        color: index == 5
                            ? kPrimaryBlue
                            : Colors.black.withOpacity(0.41)),
                  ),
                );
              }),
        ),
        SizedBox(
          height: 88.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: days.length,
            itemBuilder: (context, index) {
              return Stack(children: [
                SizedBox(
                  height: 230.h,
                ),
                Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Container(
                    width: 38.5.w,
                    height: 85.h,
                    decoration: BoxDecoration(
                        color: index == 3 ? kPrimaryBlue : Color(0xffEBEBEB),
                        borderRadius: BorderRadius.circular(48)),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            days[index],
                            style: TextStyle(
                                fontSize: 12.7.sp,
                                fontWeight: FontWeight.w300,
                                color: index == 3
                                    ? Colors.white
                                    : Colors.black.withOpacity(0.41)),
                          ),
                          Text(
                            numbers[index],
                            style: TextStyle(
                                fontSize: 17.7.sp,
                                fontWeight: FontWeight.w400,
                                color: index == 3
                                    ? Colors.white
                                    : Colors.black.withOpacity(0.41)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                if (index ==
                    3) // Only show the Positioned container on the fourth index
                  Positioned(
                    top: 3,
                    left: 21,
                    child: Container(
                      width: 12.w,
                      height: 12.h,
                      decoration: BoxDecoration(
                          color: Color(0xffFFB300),
                          borderRadius: BorderRadius.circular(100)),
                    ),
                  ),
              ]);
            },
          ),
        ),
      ],
    );
  }
}

final TextStyle yourTextStyle = TextStyle(
  color: kTextGrayColor,
  fontSize: 17.11.sp,
  fontWeight: FontWeight.w300,
);
