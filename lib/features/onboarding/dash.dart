// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ubenwa_kelvin/features/model/data/onboarding_data.dart';
import 'package:ubenwa_kelvin/features/onboarding/pageview.dart';
import 'package:ubenwa_kelvin/features/widget/custom_button.dart';
import 'package:ubenwa_kelvin/features/widget/dot_indicator.dart';

import 'package:ubenwa_kelvin/features/widget/loading_screen.dart';
import 'package:ubenwa_kelvin/features/widget/next_and_previous_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;
  double myAngle = 0.0;
  double myLittleAnle = 0.0;
  bool _isSwitching = false;

  late AnimationController _animationController;
  late Animation _animation;
  late Animation<double> _rotationAnimation;
  @override
  void initState() {
    super.initState();

    // Initialize animation controller
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

    // Define rotation animation
    _rotationAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.0, 0.5, curve: Curves.easeInOut),
      ),
    );

    // Listen to animation status
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Animation completed, reset it
        _animationController.reset();
      }
    });
  }

  void nextOnboardingData() {
    setState(() {
      if (currentIndex <= 2) {
        currentIndex = (currentIndex + 1) % onboardingDatas.length;
        myAngle += 0.25;
        myLittleAnle -= 0.25;
        _isSwitching = !_isSwitching;
      }

      // Start animation when index changes
      // _animationController.forward();
    });
  }

  void previousOnboardingData() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
        myAngle -= 0.25;
        myLittleAnle += 0.25;
        _isSwitching = !_isSwitching;
        // Start animation when index changes
        // _animationController.forward();
      });
    }
  }

  void onDragUpdate(details) {
    if (details.primaryVelocity! > 0) {
      // Swiped to the right
      setState(() {
        currentIndex = (currentIndex - 1) % onboardingDatas.length;
        if (currentIndex < 0) {
          currentIndex = onboardingDatas.length - 1;
        }
        myAngle -= 0.25;
        myLittleAnle += 0.25;
        _isSwitching = !_isSwitching;
      });
    } else if (details.primaryVelocity! < 0) {
      // Swiped to the left
      setState(() {
        currentIndex = (currentIndex + 1) % onboardingDatas.length;
        myAngle += 0.25;
        myLittleAnle -= 0.25;
        _isSwitching = !_isSwitching;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentData = onboardingDatas[currentIndex];

    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onHorizontalDragEnd: onDragUpdate,
          child: Column(
            children: [
              SizedBox(
                height: 40.h,
              ),
              CustomPageContainer(
                animationController: _animationController,
                myAngle: myAngle,
                animation: _animation,
                myLittleAnle: myLittleAnle,
                currentIndex: currentIndex,
                isSwitching: _isSwitching,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  onboardingDatas.length,
                  (index) => DotIndicator(
                    currentIndex: currentIndex,
                    index: index,
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                width: 231.w,
                child: Text(
                  currentData.title, // Use the currentData's title
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
                  currentData.description, // Use the currentData's description
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 14,
                    height: 1.2,
                    color: Color(0xff000000),
                  ),
                ),
              ),
              SizedBox(
                height: 100.h,
              ),
              Visibility(
                visible: currentIndex == 3 ? true : false,
                child: CustomButton(
                  height: 58.h,
                  width: 310.w,
                  color: Color(0xff4476F6),
                  text: "Get Started",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoadingSCreen()));
                  },
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              PrevNextButtons(
                currentIndex: currentIndex,
                onPreviousPressed: previousOnboardingData,
                onNextPressed: nextOnboardingData,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
