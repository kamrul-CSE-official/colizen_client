import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double? height;
  final VoidCallback? onTap;
  final Widget? prefixIcon;
  final Widget? nextIcon;
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  final Color? color;
  final Color? textColor;
  final double? fontSize;

  const CustomButton({
    super.key,
    this.height,
    required this.text,
    this.onTap,
    this.prefixIcon,
    this.nextIcon,
    this.child,
    this.padding,
    this.borderRadius,
    this.color,
    this.textColor,
    this.fontSize,
  });

  bool get isDisabled => onTap == null;

  @override
  Widget build(BuildContext context) {
    final BorderRadius radius = borderRadius ?? BorderRadius.circular(14);

    return Material(
      color: AppColors.black,
      borderRadius: radius,
      child: InkWell(
        splashColor: isDisabled
            ? Colors.transparent
            : Colors.white.withValues(alpha: 0.5),
        highlightColor: Colors.transparent,
        borderRadius: radius,
        onTap: onTap,
        child: Container(
          height: height,
          width: double.infinity,
          padding: padding ?? EdgeInsets.symmetric(vertical: 17),
          decoration: BoxDecoration(borderRadius: radius),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (prefixIcon != null) ...[
                SizedBox(height: 22, width: 22, child: prefixIcon!),
                SizedBox(width: 8),
              ],

              if (child == null)
                Text(
                  text,
                  textAlign: TextAlign.center,
                  // style: GoogleFonts.poppins(
                  //   fontSize: fontSize ?? 16,
                  //   fontWeight: FontWeight.w600,
                  //   color: isDisabled
                  //       ? AppColors.white.withValues(alpha: 0.7)
                  //       : (textColor ?? AppColors.white),
                  // ),
                  style: TextStyle(
                    fontSize: fontSize ?? 16,
                    fontWeight: FontWeight.w600,
                    color: isDisabled
                        ? AppColors.white.withValues(alpha: 0.7)
                        : (textColor ?? AppColors.white),
                  ),
                )
              else
                child!,

              if (nextIcon != null) ...[
                SizedBox(width: 8),
                SizedBox(width: 25, child: nextIcon!),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
