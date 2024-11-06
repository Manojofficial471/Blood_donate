import 'dart:async';

import 'package:flutter/material.dart';

import '../Login/Login.dart';

class SplashScreen extends StatefulWidget {
   SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 10), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) =>  LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
          child:Image.asset('assets/Splash.jpg'),
      ),
    );
  }
}