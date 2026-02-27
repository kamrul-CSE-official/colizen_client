import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/button.dart';
import 'package:flutter_application_1/widgets/input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hey! Welcome back",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                "Sign In to your account",
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
              SizedBox(height: 50.5),
              CustomInputField(
                hintText: "Email",
                prefixIcon: Icons.email_outlined,
                borderRadius: 50,
                borderSide: BorderSide(color: Colors.black, width: .3),
              ),
              SizedBox(height: 15.5),
              CustomInputField(
                hintText: "Password",
                prefixIcon: Icons.lock_outline,
                borderRadius: 50,
                borderSide: BorderSide(color: Colors.black, width: .3),
                suffixWidget: Icon(Icons.remove_red_eye_outlined),
              ),
              SizedBox(height: 15.5),
              InkWell(
                onTap: () {
                  print("Forgot password....");
                },
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ),
              ),
              SizedBox(height: 15.5),
              CustomButton(
                text: "Sign In",
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
