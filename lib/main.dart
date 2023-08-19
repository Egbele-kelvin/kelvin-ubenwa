import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ubenwa_kelvin/features/dashboard/dashboard.dart';
import 'package:ubenwa_kelvin/features/onboarding/onboarding_screen.dart';
import 'package:ubenwa_kelvin/features/widget/final_loading_screen.dart';
import 'package:ubenwa_kelvin/features/widget/loading_screen.dart';
import 'package:ubenwa_kelvin/features/widget/test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return ScreenUtilInit(
      designSize: const Size(393, 851),
        // minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
      builder:(context , child){
        return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "Inter",
          useMaterial3: true,
        ),
        home:  OnboardingScreen(),
      );
      }
       ,
    );
  }
}
