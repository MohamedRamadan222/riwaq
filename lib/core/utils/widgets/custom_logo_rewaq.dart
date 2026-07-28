import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomLogoRiwaq extends StatelessWidget {
  final double? fontSize;
  final Color? color;
  const CustomLogoRiwaq({super.key, this.fontSize, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      'رواق',
      style: GoogleFonts.arefRuqaa(
        fontSize: fontSize ?? 72,
        color: color ?? Colors.white,
        fontWeight: FontWeight.w700,
        height: 1,
      ),
    );
  }
}
