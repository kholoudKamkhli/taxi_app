import 'dart:async';
import 'package:flutter/material.dart';

import 'onbooardscreens.dart';


class SplashScreen extends StatefulWidget {
  static const String routeName = "SplashScreen";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(context, OnboardScreens.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: const Color.fromARGB(255, 76, 229, 177),
          height: double.infinity,
          width: double.infinity,
        ),
        Center(
          child: SizedBox(
            height: 216,
            width: 154,
            child: Image.asset("assets/images/img.png"),
          ),
        ),
      ],
    );
  }
}