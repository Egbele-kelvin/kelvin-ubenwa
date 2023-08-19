import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircularImageLayout extends StatefulWidget {
  final Animation<double> animation;
  final int stateValue;

  const CircularImageLayout(
      {required this.animation, required this.stateValue});

  @override
  State<CircularImageLayout> createState() => _CircularImageLayoutState();
}

class _CircularImageLayoutState extends State<CircularImageLayout>
    with TickerProviderStateMixin {
       late Animation<Offset> _animation;
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 10),
    vsync: this,
  )..repeat(reverse: false);

  @override
  void initState() {
    _animation = Tween<Offset>(
      begin: Offset(0, 0),
      end: Offset(200, 200),
    ).animate(_controller);
    super.initState();
  }
  // _controller = AnimationController(
  //   vsync: this,
  //   duration: Duration(seconds: 2),
  //  );
   @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    double imageSize = 200.h;
    // double centerX = 202.w / 2;
    // double centerY = imageSize / 2;
    double radius = 120;
    // double radiusTop = 100;
    //double radiusleft = -10;
    return SizedBox(
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              height: 400.h,
            ),

            Image.asset(
              'assets/image.png',
              height: imageSize,
              width: 202.w,
            ),
            AnimatedBuilder(
              animation: _controller,
              child: CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/baby_top.png'),
              ),
              builder: (BuildContext context, Widget? child) {
                return AnimatedPositioned(
                duration: Duration(seconds: 10),
                curve: Curves.fastOutSlowIn,
                top: widget.stateValue == 0
                    ? 20
                    : widget.stateValue == 1
                        ? 150
                        : widget.stateValue == 2
                            ? 320
                            : 150,
                left: widget.stateValue == 0
                    ? 160
                    : widget.stateValue == 1
                        ? 10
                        : widget.stateValue == 2
                            ? 160
                            : 320,
                child: child!,
                );
              },
            ),

            // AnimatedPositioned(
            //   duration: Duration(milliseconds: 2),
            //   curve: Curves.fastOutSlowIn,
            //   top: widget.stateValue == 0
            //       ? 150
            //       : widget.stateValue == 1
            //           ? 320
            //           : widget.stateValue == 2
            //               ? 150
            //               : 20,
            //   left: widget.stateValue == 0
            //       ? 10
            //       : widget.stateValue == 1
            //           ? 160
            //           : widget.stateValue == 2
            //               ? 320
            //               : 160,
            //   // top: 150,
            //   // left: 10,
            //   child: CircleAvatar(
            //     radius: 40,
            //     backgroundImage: AssetImage('assets/baby.png'),
            //   ),
            // ),
            // AnimatedPositioned(
            //   duration: Duration(milliseconds: 500),
            //   top: 150,
            //   right: 10,
            //   child: CircleAvatar(
            //     radius: 40,
            //     backgroundImage: AssetImage('assets/baby.png'),
            //   ),
            // ),
            // AnimatedPositioned(
            //   duration: Duration(milliseconds: 500),
            //   top: 320,
            //   left: 160,
            //   child: CircleAvatar(
            //     radius: 40,
            //     backgroundImage: AssetImage('assets/baby.png'),
            //   ),
            // ),

            // Positioned(
            //   top: 20,
            //   left: 160,
            //   child: CircleAvatar(
            //     radius: 40,
            //     backgroundImage: AssetImage('assets/baby.png'),
            //   ),
            // ),
            // Positioned(
            //   top: 150,
            //   left: 10,
            //   child: CircleAvatar(
            //     radius: 40,
            //     backgroundImage: AssetImage('assets/baby.png'),
            //   ),
            // ),
            // Positioned(
            //   top: 150,
            //   right: 10,
            //   child: CircleAvatar(
            //     radius: 40,
            //     backgroundImage: AssetImage('assets/baby.png'),
            //   ),
            // ),
            // Positioned(
            //   top: 320,
            //   left: 160,
            //   child: CircleAvatar(
            //     radius: 40,
            //     backgroundImage: AssetImage('assets/baby.png'),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
