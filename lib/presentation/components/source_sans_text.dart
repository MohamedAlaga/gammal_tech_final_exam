import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SourceSansText extends StatelessWidget {
  const SourceSansText({super.key});

  @override
  Widget build(BuildContext context) {
    String x = "\n aseda \n as \t sad";
    return Text(x, style: GoogleFonts.sourceSans3());
  }
}
