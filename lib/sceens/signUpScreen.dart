import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/signUp_controller.dart';
import 'package:flutter_application_1/sceens/loginScreen.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final controller = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.to(() => LoginScreen());
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Center(child: Text("This is signup page.")),
    );
  }
}
