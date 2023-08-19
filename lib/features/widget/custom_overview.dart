import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ubenwa_kelvin/constants/color_constants.dart';

class CustomOverviewContainer extends StatelessWidget {
  final String title;
  final String icon;
  final String number;
  final String description;
  final Color iconContainerColor;
  final Color descriptionTextColor;

  const CustomOverviewContainer({
    super.key, 
    required this.title,
     required this.icon, 
     required this.number, 
     required this.description, 
     required this.iconContainerColor, 
     required this.descriptionTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: 116.w,
        height: 120.h,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: kBoarderBlueColor)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: CircleAvatar(
                    backgroundColor: iconContainerColor,
                    child: Image.asset(icon),
                    radius: 15,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 8.1.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              number,
              style: TextStyle(
                fontSize: 20.1.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              description,
              style: TextStyle(
                fontSize: 7.1.sp,
                fontWeight: FontWeight.w400,
                color: descriptionTextColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
