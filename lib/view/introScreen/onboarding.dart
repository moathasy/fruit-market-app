import 'package:capstone_app/view/SignIn/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
            image: const Image(image: AssetImage('assets/images/onb3.jpg')),
            title: 'E Shopping',
            decoration: constantPageDecoration(),
            body: 'Explore top organic fruits & grab them'),
        PageViewModel(
          image: const Padding(
            padding: EdgeInsets.all(12.0),
            child: Image(image: AssetImage('assets/images/onb1.jpg')),
          ),
          decoration: constantPageDecoration(),
          title: 'Delivery on the way',
          body: 'Get your order by speed delivery',
        ),
        PageViewModel(
          image: const Padding(
            padding: EdgeInsets.all(20.0),
            child: Image(image: AssetImage('assets/images/onb2.jpg')),
          ),
          decoration: constantPageDecoration(),
          title: 'Delivery Arrived',
          body: 'Order is arrived at your Place',
        )
      ],
      next: const Icon(Icons.arrow_forward_rounded, color: Colors.green),
      skip: const Text('Skip',
          style: TextStyle(
              color: Colors.green, fontSize: 17, fontWeight: FontWeight.bold)),
      onSkip: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const SignInScreen(),
            ));
      },
      done: const Text(
        'Start',
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.green, fontSize: 17),
      ),
      onDone: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const SignInScreen(),
            ));
      },
      dotsDecorator: DotsDecorator(
        activeColor: Colors.green,
        color: Colors.grey,
        size: const Size(8, 8),
        activeSize: const Size(18, 8),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      showSkipButton: true,
    );
  }

  PageDecoration constantPageDecoration() => const PageDecoration(
        bodyAlignment: Alignment.center,
        bodyTextStyle:
            TextStyle(fontSize: 20, color: Color.fromARGB(243, 2, 81, 8)),
        titleTextStyle: TextStyle(
            color: Colors.green, fontSize: 22, fontWeight: FontWeight.bold),
        // imagePadding: EdgeInsets.all(24)
      );
}
