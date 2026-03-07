import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/consts/colors.dart';
import 'package:flutter_application_1/features/navbar/controllers/navbar_controllers.dart';

class NavBar extends StatelessWidget {
  NavBar({super.key});
  final controller = Get.put(NavBarController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return controller.screens[controller.currentIndex];
      }),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: controller.currentIndex,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: Color(0xFF636F85),
          showUnselectedLabels: true,
          onTap: controller.changeIndex,
          items: List.generate(controller.labels.length, (index) {
            return BottomNavigationBarItem(
              backgroundColor: AppColors.white,
              icon: Image.asset(
                controller.iconPaths[index],
                height: 26,
                width: 26,
                fit: BoxFit.fill,
                color: controller.currentIndex == index
                    ? AppColors.primary
                    : Color(0xFF636F85),
              ),
              label: controller.labels[index],
              tooltip: controller.labels[index],
            );
          }),
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 11,
            color: AppColors.primary,
          ),
          unselectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 11,
            color: Color(0xFF7C8091),
          ),
        );
      }),
    );
  }
}
