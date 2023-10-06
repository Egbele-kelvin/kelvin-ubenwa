import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DotIndicator extends StatelessWidget {
  final int currentIndex;
  final int index;

  DotIndicator({
    required this.currentIndex,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    Color activeDotColor = Color(0xffD3DEFC);
    Color inactiveDotColor = Color(0xffD3DEFC);

    if (currentIndex == 0 || currentIndex == 2) {
      activeDotColor = Color(0xffF6C144);
      inactiveDotColor = Color(0xffD3DEFC);
    } else if (currentIndex == 1 || currentIndex == 3) {
      activeDotColor = Color(0xff4476F6);
      inactiveDotColor = Color(0xffD3DEFC);
    }

    return Container(
      height: currentIndex == index ? 5.91.h : 5.91.h,
      width: currentIndex == index ? 16.41.w : 5.91.w,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentIndex == index ? activeDotColor : inactiveDotColor,
      ),
    );
  }
}
