import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/login_controller.dart';
import 'package:flutter_application_1/sceens/roleSelectionScreen.dart';
import 'package:flutter_application_1/widgets/appDialog.dart';
import 'package:flutter_application_1/widgets/button.dart';
import 'package:flutter_application_1/widgets/input.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final controller = Get.put(LoginController());

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
              SizedBox(height: 25.5),
              CustomButton(
                text: "Sign In",
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                onTap: () {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (_) => AppDialog(
                      title: "Congratulations!",
                      message: "You have successfully logged in.",
                      showLoader: true,
                      icon: const Icon(
                        Icons.person,
                        size: 40,
                        color: Colors.black,
                      ),
                    ),
                  );

                  Future.delayed(const Duration(seconds: 4), () {
                    Navigator.pop(context); // close dialog
                    // Get.to(() => NavBar());
                  });
                },
              ),
              SizedBox(height: 40.0),
              Row(
                children: [
                  Expanded(child: Divider(color: Color(0xFFDDDDDD))),
                  SizedBox(width: 6),
                  Text(
                    "Or login with",
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  SizedBox(width: 6),
                  Expanded(child: Divider(color: Color(0xFFDDDDDD))),
                ],
              ),
              SizedBox(height: 40.0),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 20.0,
                  horizontal: 20.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: const Color(0xFFDDDDDD)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/google.png"),
                    SizedBox(width: 10.0),
                    Text(
                      "Continue with Google",
                      style: TextStyle(fontSize: 16.0, color: Colors.black),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 70),
              Align(
                alignment: Alignment.center,
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: 16, color: Colors.black),
                    children: [
                      TextSpan(text: "Don’t have an account?"),
                      TextSpan(
                        text: " Register",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.to(() => RoleSelectionScreen());
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
