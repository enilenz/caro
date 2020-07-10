import 'package:flutter/material.dart';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import '../main.dart' as main;

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Container(
        child: Hero(
          tag: 'splashScreenTag',
          child: Icon(
            Icons.local_dining,
            color: Colors.amber,
            size: 130,
          ),
        ),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
      ),
      duration: 3000,
      nextScreen: main.MyHomeScreen(),
      centered: true,
      backgroundColor: Colors.teal[900],
      splashTransition: SplashTransition.values[0],
      pageTransitionType: PageTransitionType.rightToLeft,
    );
  }
}
