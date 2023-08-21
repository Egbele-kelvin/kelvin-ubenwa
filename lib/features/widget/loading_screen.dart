import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ubenwa_kelvin/constants/color_constants.dart';
import 'package:ubenwa_kelvin/features/widget/final_loading_screen.dart';

class LoadingSCreen extends StatefulWidget {
  const LoadingSCreen({super.key});

  @override
  State<LoadingSCreen> createState() => _LoadingSCreenState();
}

class _LoadingSCreenState extends State<LoadingSCreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _sizeAnimation;
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 10),
    vsync: this,
  )..repeat(reverse: false);
  @override
  void initState() {
    Timer(Duration(seconds: 8), () {
       Navigator.push(
              context,
              AnimatedScalePageRoute(
                builder: (context) => FinalLoading(),
              ),
            );
    });
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 5));

    _sizeAnimation = TweenSequence<double>(
      [
        TweenSequenceItem<double>(
          tween: Tween<double>(
            begin: 50,
            end: 100,
          ),
          weight: 50,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(
            begin: 100,
            end: 50,
          ),
          weight: 50,
        ),
      ],
    ).animate(_animationController);
    _animationController.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryBlue,
      body: Stack(children: [
        AnimatedBuilder(
          animation: _controller,
          child: Image.asset("assets/images/drop.png"),
          builder: (BuildContext context, Widget? child) {
            return AnimatedPositioned(
              duration: Duration(milliseconds: 10), // Set your desired duration
              curve: Curves.easeInOut, // Set your desired curve
              top: _controller.value *
                  1000, // Adjust the top position based on your needs
              left: 190.w,

              child: child!,
            );
          },
        ),
        Align(
            alignment: Alignment.topCenter,
            child: Image.asset("assets/images/babybottle.png")),

        Center(
          child: SizedBox(
          width: 240.w,
          child: Text(
            "Please wait while we gather your Baby’s data...",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 18.sp,
              color: Colors.white
            ),
          ),
          ),
        ),

        Align(
          alignment: Alignment.bottomCenter,
          child: AnimatedBuilder(
            animation: _sizeAnimation,
            builder: (context, child) => Hero(
              tag: "tag",
              child: Container(
                width: double.infinity,
                height: _sizeAnimation.value,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/images/milk.png"),
                  fit: BoxFit.cover,
                )),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
