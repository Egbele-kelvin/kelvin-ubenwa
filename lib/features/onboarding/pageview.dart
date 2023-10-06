import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ubenwa_kelvin/constants/color_constants.dart';
import 'package:ubenwa_kelvin/features/model/data/onboarding_data.dart';
import 'package:ubenwa_kelvin/features/widget/custom_round_baby_container.dart';

class CustomPageContainer extends StatelessWidget {
  const CustomPageContainer({
    super.key,
    required AnimationController animationController,
    required this.myAngle,
    required Animation animation,
    required this.myLittleAnle,
    required this.currentIndex,
    required bool isSwitching,
  })  : _animationController = animationController,
        _animation = animation,
        _isSwitching = isSwitching;

  final AnimationController _animationController;
  final double myAngle;
  final Animation _animation;
  final double myLittleAnle;
  final int currentIndex;
  final bool _isSwitching;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Align(
            alignment: Alignment.center,
            child: AnimatedBuilder(
                animation: _animationController,
                builder: (context, _) {
                  return AnimatedRotation(
                    curve: Curves.easeInOut,
                    turns: myAngle,
                    duration: const Duration(seconds: 2),
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 200,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: CustomBabyContainer(
                              turns: myLittleAnle,
                              image: babyImages[
                                  currentIndex], // Use the currentData's image
                              backgroundColor: currentIndex == 0
                                  ? kActiveOrangeColor
                                  : kBlushBabyColor,
                            ),
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: CustomBabyContainer(
                              turns: myLittleAnle,
                              image: babyImages[
                                  currentIndex], // Use the currentData's image
                              backgroundColor: currentIndex == 2
                                  ? kActiveOrangeColor
                                  : kHappyBabyColor,
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: CustomBabyContainer(
                              turns: myLittleAnle,
                              image: babyImages[
                                  currentIndex], // Use the currentData's image
                              backgroundColor: currentIndex == 1
                                  ? kActiveBlueColor
                                  : kCryBabyColor,
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: CustomBabyContainer(
                              turns: myLittleAnle,
                              image: babyImages[
                                  currentIndex], // Use the currentData's image
                              backgroundColor: currentIndex == 3
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
          Align(
            alignment: Alignment.center,
            child: AnimatedCrossFade(
              duration: const Duration(seconds: 1),
              crossFadeState: _isSwitching
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              firstChild: Image.asset(
                onboardingDatas[currentIndex].imagePath,
                height: 180.h,
                width: 180.w,
                fit: BoxFit.fill,
              ),
              secondChild: Image.asset(
                onboardingDatas[currentIndex].imagePath,
                height: 200.h,
                width: 202.w,
                fit: BoxFit.fill,
              ),
            ),
          )
        ],
      ),
    );
  }
}
