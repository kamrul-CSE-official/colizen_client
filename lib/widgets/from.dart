import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/button.dart';
import 'package:flutter_application_1/widgets/input.dart';

class loginscreen extends StatefulWidget {
  const loginscreen({super.key});

  @override
  State<loginscreen> createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {
  final namecontroller = TextEditingController();
  final emailcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Text("Create account"),

              const SizedBox(height: 20),

              SizedBox(height: 20),

              CustomInputField(hintText: "Full name"),
              SizedBox(height: 20),
              CustomInputField(hintText: "Last name"),
              SizedBox(height: 20),
              CustomButton(text: "Submit", onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
