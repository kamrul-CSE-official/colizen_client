import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Brand Colors
  static const Color primary = Color(0xFF4F1CAE);

  static Color secondary = Color(0xFF1BBFDC);
  static Color backgroundColor = Color(0xffF6F2FD);

  static Color scaffoldBackground = Color(0xFFF9F9F9);

  // Gradient Colors
  static const Gradient linearGradient = LinearGradient(
    begin: Alignment(0.0, 0.0),
    end: Alignment(0.707, -0.707),
    colors: [Color(0xfffffa9e), Color(0xFFFAD0C4), Color(0xFFFAD0C4)],
  );

  // Text Colors
  static const Color textPrimary = Color(0xFF1C2026);
  static const Color textSecondary = Color(0xFF646668);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color grey = Color(0xFfE5E7EC);
  static const Color fillcolor = Color(0xffEFE9FB);
  static const Color error = Color(0xffDC3545);

  static const Color containerBorder = Color(0xFFD7D9DA);
}
