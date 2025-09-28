import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sohail_portfolio/presentation/screens/landing_page.dart';

void main() {
  runApp(ScreenUtilInit(
    designSize: Size(1440, 1024), // your design dimensions
    minTextAdapt: true,
    builder: (context, child) => MyApp(),
  ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(


      home: LandingPage(),
     debugShowCheckedModeBanner: false,
    );
  }
}

