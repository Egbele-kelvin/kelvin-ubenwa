


import 'package:flutter/material.dart';

class CustomBabyContainer extends StatelessWidget {
  final String image;
  final Color backgroundColor;
  final double turns;
  const CustomBabyContainer(
      {super.key,
      required this.image,
      required this.backgroundColor,
      required this.turns});

  @override
  Widget build(BuildContext context) {
    return AnimatedRotation(
      curve: Curves.easeInOut,
      duration: const Duration(seconds: 2),
      turns: turns,
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
            color: backgroundColor, borderRadius: BorderRadius.circular(100)),
        child: Center(
          child: Image.asset(image),
        ),
      ),
    );
  }
}
