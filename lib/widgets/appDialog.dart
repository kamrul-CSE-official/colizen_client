import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AppDialog extends StatelessWidget {
  final String? title;
  final String? message;
  final Widget? icon;
  final bool showLoader;
  final Widget? customContent;

  const AppDialog({
    super.key,
    this.title,
    this.message,
    this.icon,
    this.showLoader = false,
    this.customContent,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 🔹 Icon (optional)
            if (icon != null) ...[
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.grey.shade400,
                child: icon,
              ),
              const SizedBox(height: 20),
            ],

            // 🔹 Title
            if (title != null) ...[
              Text(
                title!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 12),
            ],

            // 🔹 Message
            if (message != null) ...[
              Text(message!, textAlign: TextAlign.center),
              const SizedBox(height: 20),
            ],

            // 🔹 Custom Content (optional)
            if (customContent != null) customContent!,

            // 🔹 Loader (optional)
            if (showLoader) ...[
              const SizedBox(height: 20),
              const SpinKitFadingCircle(color: Colors.black),
            ],
          ],
        ),
      ),
    );
  }
}
