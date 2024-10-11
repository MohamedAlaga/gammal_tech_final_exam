import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SourceSansText extends StatelessWidget {
  const SourceSansText(
      {super.key,
      required this.text,
      this.fontsize = 20,
      this.fontWeight = FontWeight.w600,
      this.color = const Color(0xFF094546)});
  final String text;
  final double fontsize;
  final FontWeight fontWeight;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.sourceSans3(
          color: color,
          fontSize: fontsize,
          fontWeight: fontWeight,
        ));
  }
}
