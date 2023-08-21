import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ubenwa_kelvin/features/model/data/onboarding_data.dart';
import 'package:ubenwa_kelvin/features/onboarding/pageview.dart';
import 'package:ubenwa_kelvin/features/widget/custom_button.dart';
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
                        print("Going forward");
                            myAngle += 0.25;
                        myLittleAnle -= 0.25;
                      } else  {
                        print("Going backward");
                         myAngle -= 0.25;
                        myLittleAnle += 0.25;
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
                    return CustomPageView(
                      data: data,
                      currentIndex: currentIndex,
                      myAngle: myAngle,
                      myLittleAnle: myLittleAnle,
                      animationController: _animationController,
                      animation: _animation,
                      isSwitching: _isSwitching,
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

 
}



