import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:google_fonts/google_fonts.dart';
class CodeSnippetCard extends StatefulWidget {
  const CodeSnippetCard(
      {super.key,
      required this.codeSnippet,
      required this.language,
      required this.theme});
  final String codeSnippet;
  final String language;
  final Map<String, TextStyle> theme;

  @override
  State<CodeSnippetCard> createState() => _CodeSnippetCardState();
}

class _CodeSnippetCardState extends State<CodeSnippetCard> {
  String displayedCode = ''; 
  int currentIndex = 0;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTypewriterEffect();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  void didUpdateWidget(CodeSnippetCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    resetTypewriterEffect();

  }

  void startTypewriterEffect() {
    timer = Timer.periodic(const Duration(milliseconds: 40), (Timer t) {
      if (currentIndex < widget.codeSnippet.length) {
        setState(() {
          displayedCode += widget.codeSnippet[currentIndex];
          currentIndex++;
        });
      } else {
        timer?.cancel();
      }
    });
  }

  void resetTypewriterEffect() {
    displayedCode = ''; 
    currentIndex = 0;
    timer?.cancel();
    startTypewriterEffect();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFFF904D)),
        color: widget.theme["root"]!.backgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(6)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: HighlightView(
          displayedCode,
          language: widget.language,
          theme: widget.theme,
          padding: const EdgeInsets.all(12),
          textStyle: GoogleFonts.sourceCodePro(),
        ),
      ),
    );
  }
}