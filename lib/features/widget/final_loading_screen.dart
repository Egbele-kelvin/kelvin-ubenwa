import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ubenwa_kelvin/features/dashboard/dashboard.dart';

class FinalLoading extends StatefulWidget {
  const FinalLoading({super.key});

  @override
  State<FinalLoading> createState() => _FinalLoadingState();
}

class _FinalLoadingState extends State<FinalLoading> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _sizeAnimation;
  @override
  void initState() {
  _animationController = AnimationController(
        vsync: this, duration: Duration(seconds: 5));

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

    Timer(Duration(seconds: 1), () {
       Navigator.push(
              context,
              AnimatedScalePageRoute(
                builder: (context) => DashBoardScreen(),
              ),
            );
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: AnimatedBuilder(
        animation: _sizeAnimation,
        builder: (context, child) =>  Hero(
          tag: "tag",
          child: Container(
            // width: _sizeAnimation.value,
            height: _sizeAnimation.value * 200.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/milk2.png"),   
                fit: BoxFit.cover,
              )
            ),
          ),
        ),
      ),
    );
  }
}



class AnimatedScalePageRoute<T> extends PageRouteBuilder<T> {
  final WidgetBuilder builder;

  AnimatedScalePageRoute({required this.builder})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) =>
              builder(context),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = 0.8;
            const end = 1.0;
            const curve = Curves.easeInOut;

            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            var offsetTween = Tween(begin: const Offset(0, 1), end: Offset.zero).chain(CurveTween(curve: curve));
            
            var offsetAnimation = animation.drive(offsetTween);

            return ScaleTransition(
              scale: animation.drive(tween),
              child: SlideTransition(
                position: offsetAnimation,
                child: child,
              ),
            );
          },
        );
}