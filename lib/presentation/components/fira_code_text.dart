import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FiraCodeText extends StatelessWidget {
  const FiraCodeText(
      {super.key,
      required this.text,
      this.fontSize = 24.0,
      this.fontWeight = FontWeight.w600,
      this.color = const Color(0xFF004B4C),
      this.textAlign = TextAlign.center});
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.firaCode(
          textStyle: TextStyle(
              fontSize: fontSize, fontWeight: fontWeight, color: color)),
    );
  }
}
