import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           IconButton(
       onPressed: () {},
       icon: Icon(
         Icons.arrow_back_ios_new_outlined,
         color: Color(0xff292D32),
       )),
           Text("Cry Records",style: TextStyle(
             fontWeight: FontWeight.w600,
             fontSize: 18.sp,
             color: Colors.black
           ),),
           Icon(
             Icons.notifications_outlined,
             size: 22.sp,
             color: Color(0xff292D32),
           ),
         ],
       );
  }
}
