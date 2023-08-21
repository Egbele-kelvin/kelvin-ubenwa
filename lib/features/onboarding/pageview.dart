import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ubenwa_kelvin/constants/color_constants.dart';
import 'package:ubenwa_kelvin/constants/string_constants.dart';
import 'package:ubenwa_kelvin/features/model/data/onboarding_data.dart';
import 'package:ubenwa_kelvin/features/widget/custom_round_baby_container.dart';

class CustomPageView extends StatelessWidget {
  final  data;
  final int currentIndex;
  final double myAngle;
  final double myLittleAnle;
  final AnimationController animationController;
  final Animation animation;
  final bool isSwitching;

  const CustomPageView({super.key, 
  required this.currentIndex, 
  required this.myAngle, 
  required this.myLittleAnle, 
  required this.animationController, 
  required this.isSwitching, 
  this.data, 
  required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        Expanded(
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Positioned(
                                top: 80,
                                left: 85,
                                child: AnimatedBuilder(
                                    animation: animationController,
                                    builder: (context, _) {
                                      return AnimatedRotation(
                                        curve: Curves.easeInOut,
                                        duration: const Duration(seconds: 2),
                                        turns: myAngle,
                                        child: CircleAvatar(
                                          backgroundColor: Colors.transparent,
                                          radius: animation.value,
                                          child: Stack(
                                            clipBehavior: Clip.none,
                                            children: [
                                              Positioned(
                                                bottom: -80,
                                                left: (MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        2) -
                                                    120,
                                                child: CustomBabyContainer(
                                                  turns: myLittleAnle,
                                                  image: babyDown,
                                                  backgroundColor:
                                                      currentIndex == 0
                                                          ? kActiveOrangeColor
                                                          : kBlushBabyColor,
                                                ),
                                              ),
                                              Positioned(
                                                top: -80,
                                                left: (MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        2) -
                                                    120,
                                                child: CustomBabyContainer(
                                                  turns: myLittleAnle,
                                                  image: babyTop,
                                                  backgroundColor:
                                                      currentIndex == 2
                                                          ? kActiveOrangeColor
                                                          : kHappyBabyColor,
                                                ),
                                              ),
                                              Positioned(
                                                top: 81,
                                                left: (MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        2) +
                                                    30,
                                                child: CustomBabyContainer(
                                                  turns: myLittleAnle,
                                                  image: babyRight,
                                                  backgroundColor:
                                                      currentIndex == 1
                                                          ? kActiveBlueColor
                                                          : kCryBabyColor,
                                                ),
                                              ),
                                              Positioned(
                                                top: 81,
                                                left: -75,
                                                child: CustomBabyContainer(
                                                  turns: myLittleAnle,
                                                  image: babyLeft,
                                                  backgroundColor:
                                                      currentIndex == 3
                                                          ? kActiveBlueColor
                                                          : kCryBabyColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                              Positioned(
                                top: 100,
                                left: 105,
                                child: AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 500),
                                  child: FadeTransition(
                                    opacity: isSwitching
                                        ? Tween<double>(begin: 0.2, end: 1.0)
                                            .animate(
                                            CurvedAnimation(
                                              parent: animationController,
                                              curve: Curves.easeInOut,
                                            ),
                                          )
                                        : AlwaysStoppedAnimation(1.0),
                                    child: Image.asset(
                                      data.imagePath,
                                      height: 200.h,
                                      width: 202.w,
                                      fit: BoxFit.fill,
                                      key: ValueKey<int>(currentIndex),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            onboardingDatas.length,
                            (index) => buildDot(index, context),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        SizedBox(
                          width: 231.w,
                          child: Text(
                            data.title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 22,
                              height: 1.3,
                              color: Color(0xff3A3A3A),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        SizedBox(
                          width: 302.w,
                          child: Text(
                            data.description,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 14,
                              height: 1.2,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                      ],
                    );
  }

   Container buildDot(int index, BuildContext context) {
    Color activeDotColor = Color(0xffD3DEFC);
    Color inactiveDotColor = Color(0xffD3DEFC);
    if (index == 0) {
      activeDotColor = Color(0xffF6C144);
      inactiveDotColor = Color(0xffD3DEFC);
    } else if (index == 1) {
      activeDotColor = Color(0xff4476F6);
      inactiveDotColor = Color(0xffD3DEFC);
    } else if (index == 2) {
      activeDotColor = Color(0xffF6C144);
      inactiveDotColor = Color(0xffD3DEFC);
    } else if (index == 3) {
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