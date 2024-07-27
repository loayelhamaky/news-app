import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/ui/screens/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = 'Splash';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration (seconds: 2), () {
      Navigator.pushReplacementNamed(context,  HomeScreen.routeName);
    });
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Image.asset('lib/assets/images/img.png',fit: BoxFit.cover,
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,)
    );
  }
}

