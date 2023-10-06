import 'package:flutter/material.dart';

class PrevNextButtons extends StatelessWidget {
  final int currentIndex;
  final VoidCallback onPreviousPressed;
  final VoidCallback onNextPressed;

  PrevNextButtons({
    required this.currentIndex,
    required this.onPreviousPressed,
    required this.onNextPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Visibility(
          visible: currentIndex == 0 ? false : true,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: onPreviousPressed,
              child: Text(
                "Previous",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Color(0xff858585),
                ),
              ),
            ),
          ),
        ),
        Visibility(
          visible: currentIndex <= 2 ? true : false,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: onNextPressed,
              child: Text(
                currentIndex == 0 ? "Show Me How" : "Next",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Color(0xff4476F6),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
