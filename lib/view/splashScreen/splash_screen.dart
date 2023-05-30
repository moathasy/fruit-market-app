import 'dart:async';

import 'package:capstone_app/view/introScreen/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () {

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OnboardingScreen(),));
     });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Image(image: AssetImage('assets/images/splash2 1.png'),fit: BoxFit.fill,)),
    );
  }
}