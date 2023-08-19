import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TestData extends StatefulWidget {
  const TestData({super.key});

  @override
  State<TestData> createState() => _TestDataState();
}

class _TestDataState extends State<TestData>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;
  late Animation _curve;
 bool isFav = false;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );


        _curve = CurvedAnimation(parent: _controller, curve: Curves.bounceInOut);

    _animation = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(tween: Tween<double>(begin: 130,end: 150),
         weight: 50),
         TweenSequenceItem<double>(tween: Tween<double>(begin: 150,end: 130),
         weight: 50),
      ]
    ).animate(_controller);


    _controller.addStatusListener((status) { 
     if(status == AnimationStatus.completed){
          setState(() {
            isFav = true;
          });  
     }
     if(status == AnimationStatus.dismissed){
          setState(() {
            isFav = false;
          });  
     }
    });
  }

  @override
  double myPaddingValue = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.withOpacity(0.5),
      body: Center(
        child: SizedBox(
              height: 500,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: 80,
                    left: 85,
                    child: AnimatedBuilder(
                      animation: _controller,
                      builder: (context, _) {
                        return CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: _animation.value,
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Positioned(
                                bottom: -90,
                                left: (MediaQuery.of(context).size.width / 2) - 135,
                                child: CircleAvatar(
                                  radius: 40,
                                  backgroundImage: AssetImage("assets/images/second_baby_left.png"),
                                ),
                              ),
                              Positioned(
                                top: -80,
                                left: (MediaQuery.of(context).size.width / 2) - 135,
                                child: CircleAvatar(
                                  radius: 40,
                                  backgroundImage: AssetImage("assets/images/first_baby_top.png"),
                                ),
                              ),
                              Positioned(
                                top: 81,
                                left: (MediaQuery.of(context).size.width / 2) + 35,
                                child: CircleAvatar(
                                  radius: 40,
                                  backgroundImage: AssetImage("assets/images/first_baby_right.png"),
                                ),
                              ),
                              Positioned(
                                top: 81,
                                left: -75,
                                child: CircleAvatar(
                                  radius: 40,
                                  backgroundImage: AssetImage("assets/images/first_baby_left.png"),
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                    ),
                  ),
                  // Positioned(
                  //   top: 100,
                  //   left: 105,
                  //   child: Image.asset(
                  //     "assets/images/onbaording_second.png",
                  //     height: 200.h,
                  //     width: 202.w,
                  //     fit: BoxFit.fill,
                  //   ),
                  // ),
                ],
              ),
            ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
       isFav ?_controller.reverse()   : _controller.forward();
          // _animate();
// setState(() => myAngle += 0.25);
// setState(() => myPaddingValue = 0.25);
        },
        child: const Icon(Icons.rotate_right_outlined),
      ),
    );
  }
}


