import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_styles.dart';

class CustomElevatedButton extends StatelessWidget {
  final String title;
  final double? height;
  final double? width;
  final double? radius;
  final VoidCallback? onPressed;
  final Widget? icon;
  final double? fontSize;
  final Color? color;
  final Color? fontColor;

  const CustomElevatedButton({
    super.key,
    required this.title,
    this.height,
    this.width,
    this.radius,
    this.onPressed,
    this.icon,
    this.fontSize,
    this.color,
    this.fontColor,
  });

  @override
  Widget build(BuildContext context) {
    final label = Text(
      title,
      style: AppStyles.bold13.copyWith(
        color: fontColor ?? Colors.white,
        fontSize: fontSize ?? 18,
      ),
    );
    final style = ElevatedButton.styleFrom(
      backgroundColor: color ?? AppColors.primary,
      foregroundColor: Colors.white,
      minimumSize: Size(width ?? double.infinity, height ?? 54),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius ?? 16),
      ),
      // elevation: 3,
    );

    if (icon != null) {
      return ElevatedButton.icon(
        onPressed: onPressed,
        icon: icon!,
        label: label,
        style: style,
      );
    }

    return ElevatedButton(onPressed: onPressed, style: style, child: label);
  }
}
