import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/consts/icon_path.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/features/home/sceens/home_screen.dart';

class NavBarController extends GetxController {
  final _selectedIndex = 0.obs;
  int get currentIndex => _selectedIndex.value;

  void changeIndex(int index) {
    _selectedIndex.value = index;
  }

  final List<Widget> screens = [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ];

  final List<String> labels = ['Home', 'My Booking', 'Message', 'Profile'];

  final List<String> iconPaths = [
    IconPath.home,
    IconPath.booking,
    IconPath.message,
    IconPath.profile,
  ];

  void backToHome() {
    changeIndex(0);
  }
}
