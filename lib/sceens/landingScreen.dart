import 'package:flutter/material.dart';
import 'package:flutter_application_1/sceens/homeScreen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 4), () {
      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Spacer(),
              Image.asset("assets/logo.png", width: 200, height: 200),
              Spacer(),
              SpinKitFadingCircle(color: Colors.black),
              SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }
}
