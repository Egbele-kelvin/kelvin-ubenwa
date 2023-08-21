import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomChallangeContainer extends StatelessWidget {
  const CustomChallangeContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, bottom: 20, top: 10),
      child: Container(
        width: 171.w,
        height: 194.h,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Color(0xffB7B7B7))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.0, top: 10.h, bottom: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/images/star.png"),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      "Daily Challenge",
                      style: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Transform.rotate(
          angle: 3.14,
          child: Container(
            width: 108.w,
                height: 108.h,
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xffFCE1A2),
                    Color(0xffDEA00F),
                    Color(0xffEFEFEF),
                  ],
                  stops: [
                    0.4,
                    0.9,
                    0.9,
                  ]),
            ),
            child: Center(
                  child: Material(
                    elevation: 4,
                    borderRadius: BorderRadius.circular(100),
                    child: Transform.rotate(
                      angle: 3.14,
                      child: Container(
                        width: 76.w,
                        height: 76.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("8",style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                                  
                            ),
                            ),
                            Text("out of 12",style: TextStyle(
                              fontSize: 6.4,
                              fontWeight: FontWeight.w400,
                                  
                            ),),
                            Text("hours of silence",style: TextStyle(
                              fontSize: 6.4,
                              fontWeight: FontWeight.w400,
                                  
                            ),),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
          ),
        ),
            )),
          ],
        ),
      ),
    );
  }
}
