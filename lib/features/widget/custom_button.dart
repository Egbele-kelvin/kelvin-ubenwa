

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double height, width, textSize, borderRadius;
  final Color color, textColor;
  final Function()? onPressed;
  final FontWeight fontWeight;
  final Widget? child;

  final double? elevation;
  const CustomButton ({
    super.key,
    required this.text,
    required this.onPressed,
    this.height = 48,
    this.color = Colors.white,
    this.width = double.maxFinite,
    this.borderRadius = 20,
    this.textColor = Colors.white,
    this.textSize = 16,
    this.fontWeight = FontWeight.w700,
    this.elevation = 1, this.child,

  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
      width: width.w,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: elevation??1,
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            )),
        child:child??Text(
          text,
          style: TextStyle(
            fontSize: textSize.sp,
            fontWeight: fontWeight,
            color: textColor,
          ),

        ),
      ),
    );
  }
}