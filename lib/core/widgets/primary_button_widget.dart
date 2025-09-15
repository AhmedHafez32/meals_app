
import 'package:flutter/material.dart';

import '../styles/app_colors.dart';

class PrimaryButtonWidget extends StatelessWidget {
  final String buttonText;
  final Color? buttonColor;
  final double? width;
  final double? height;
  final double? borderRadius;
  final double? fontSize;
  final Color? textColor;
  final void Function() onPress;
  const PrimaryButtonWidget({
    super.key,
    required this.buttonText,
    this.buttonColor,
    this.width,
    this.height,
    this.borderRadius,
    this.fontSize,
    this.textColor,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor ?? AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 8),
        ),
        fixedSize: Size(width ?? 331, height ?? 56),
      ),
      child: Text(
        buttonText,
        style: TextStyle(
          color: textColor ?? AppColors.whiteColor,
          fontSize: fontSize ?? 16,
        ),
      ),
    );
  }
}
