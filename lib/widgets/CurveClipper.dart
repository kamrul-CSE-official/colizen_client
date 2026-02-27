import 'package:flutter/material.dart';

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    // ১. বাম দিক থেকে শুরু (একদম নিচ পর্যন্ত)
    path.lineTo(0, size.height);

    // ২. কার্ভটি ওপরের দিকে টেনে তোলা
    path.quadraticBezierTo(
      size.width / 2, // X: মাঝখানে থাকবে
      size.height -
          50, // Y: উচ্চতা থেকে ১৫০ পিক্সেল বিয়োগ (এটাই ওপরের দিকে টানবে)
      size.width, // X: একদম ডান পাশে শেষ হবে
      size.height, // Y: আবার নিচে ফিরে আসবে
    );

    path.lineTo(size.width, 0); // উপরে ফিরে যাওয়া
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
