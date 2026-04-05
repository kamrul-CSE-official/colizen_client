import 'package:flutter/material.dart';
import 'package:flutter_application_1/sceens/landingScreen.dart';
import 'package:get/get.dart';

// https://www.figma.com/design/GAhPw5rC8mSYrC5kOIP1Qo/josi91--App?node-id=8227-10003&t=cz43aQ4WLgcPgvm4-0

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Deliveries App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      home: LandingScreen(),
    );
  }
}
