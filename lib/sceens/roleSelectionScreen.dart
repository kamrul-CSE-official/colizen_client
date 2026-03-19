import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/appBackButton.dart';
import 'package:flutter_application_1/widgets/button.dart';
import 'package:flutter_application_1/widgets/roleCard.dart';
import 'package:get/get.dart';
import '../controllers/role_controller.dart';

class RoleSelectionScreen extends StatelessWidget {
  RoleSelectionScreen({super.key});

  final controller = Get.put(RoleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const AppBackButton(), elevation: 0),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Choose Your Role",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Text(
              "You have to choose a role to continue.",
              style: TextStyle(color: Colors.grey[600]),
            ),

            const SizedBox(height: 30),

            // 🔥 Reactive UI
            Obx(
              () => Column(
                children: [
                  RoleCard(
                    title: "I’m a Traveler",
                    icon: Icons.person,
                    isSelected:
                        controller.selectedRole.value == UserRole.traveler,
                    onTap: () => controller.selectRole(UserRole.traveler),
                  ),

                  RoleCard(
                    title: "I’m a Sender",
                    icon: Icons.person,
                    isSelected:
                        controller.selectedRole.value == UserRole.sender,
                    onTap: () => controller.selectRole(UserRole.sender),
                  ),
                ],
              ),
            ),

            const Spacer(),
            CustomButton(
              text: "Next",
              borderRadius: BorderRadius.all(Radius.circular(50.0)),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
