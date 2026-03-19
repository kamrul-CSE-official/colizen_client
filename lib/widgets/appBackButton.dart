import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBackButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? iconColor;
  final double size;

  const AppBackButton({
    super.key,
    this.onTap,
    this.backgroundColor,
    this.iconColor,
    this.size = 40,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () => Get.back(),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          // border: Border.all(color: Colors.grey.shade300),
        ),
        child: Icon(
          Icons.arrow_back,
          size: 18,
          color: iconColor ?? Colors.black,
        ),
      ),
    );
  }
}
