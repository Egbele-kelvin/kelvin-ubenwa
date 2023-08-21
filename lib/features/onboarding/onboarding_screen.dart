import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ubenwa_kelvin/constants/color_constants.dart';
import 'package:ubenwa_kelvin/constants/string_constants.dart';
import 'package:ubenwa_kelvin/features/model/data/onboarding_data.dart';
import 'package:ubenwa_kelvin/features/widget/custom_button.dart';
import 'package:ubenwa_kelvin/features/widget/custom_round_baby_container.dart';
import 'package:ubenwa_kelvin/features/widget/custom_scrol.dart';
import 'package:ubenwa_kelvin/features/widget/loading_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  PageController pageController = PageController();
  late AnimationController _animationController;
  late Animation _animation;
  bool isFav = false;
  late int currentIndex = 0;
  double myAngle = 0.0;
  double myLittleAnle = 0.0;
  int _previousPage = 0;
  double initialAngle = 0.0; // Store the initial angle
  bool _isSwitching = false;


  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    _animation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 120, end: 80), weight: 50),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 80, end: 120), weight: 50),
    ]).animate(_animationController);
    pageController.addListener(() {
      setState(() {
        currentIndex = pageController.page!.toInt();
      });
    });

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        isFav = true;
      }
      if (status == AnimationStatus.dismissed) {
        isFav = false;
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
     pageController.dispose();
    super.dispose();
  }

  void _rotateImage() {
    _animationController.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: Stack(
              children: [
                PageView.builder(
                  physics: DisableLeftScrollPhysics(),
                  itemCount: onboardingDatas.length,
                  controller: pageController,
                  onPageChanged: (value) {
                    setState(() {
                      _previousPage = currentIndex;
                      currentIndex = value;
                      if (currentIndex > _previousPage) {
                            myAngle += 0.25;
                        myLittleAnle -= 0.25;
                      } else  {
                        currentIndex = _previousPage;
                        pageController.jumpToPage(currentIndex);
                      }

                         _isSwitching = true; // this is for the opacity fading animation
                      if (myAngle == initialAngle) {
                        print("Circular image in initial angle!");
                      }
                    });
                  },
                  itemBuilder: (context, index) {
                    var data = onboardingDatas[index];

                    if (currentIndex == index) {
                      _rotateImage();
                    }
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
                                    animation: _animationController,
                                    builder: (context, _) {
                                      return AnimatedRotation(
                                        curve: Curves.easeInOut,
                                        duration: const Duration(seconds: 2),
                                        turns: myAngle,
                                        child: CircleAvatar(
                                          backgroundColor: Colors.transparent,
                                          radius: _animation.value,
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
                                    opacity: _isSwitching
                                        ? Tween<double>(begin: 0.2, end: 1.0)
                                            .animate(
                                            CurvedAnimation(
                                              parent: _animationController,
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
                  },
                )
              ],
            )),
            SizedBox(
              height: 15.h,
            ),
            Visibility(
              visible: currentIndex == 3 ? true : false,
              child: CustomButton(
                height: 58.h,
                width: 310.w,
                color: Color(0xff4476F6),
                text: "Get Started",
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoadingSCreen()));
                },
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  visible: currentIndex == 0 ? false : true,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                        onPressed: () {
                          setState(() {
                            myAngle -= 0.25;
                            myLittleAnle += 0.25;
                            currentIndex--;
                            pageController.previousPage(
                                duration: const Duration(seconds: 2),
                                curve: Curves.ease);
                          });
                        },
                        child: Text("Previous",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16.sp,
                                color: Color(0xff858585)))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          if (currentIndex < 3) {
                            currentIndex++;
                            pageController.nextPage(
                                duration: const Duration(seconds: 2),
                                curve: Curves.ease);
                          }
                        });
                      },
                      child: Text(
                        currentIndex == 0 ? "Show Me How" : "Next",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                            color: Color(0xff4476F6)),
                      )),
                ),
              ],
            )
          ],
        ),
      ),
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



