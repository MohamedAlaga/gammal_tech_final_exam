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
  final ScrollController _scrollController =
      ScrollController(); // Add a ScrollController

  @override
  void initState() {
    super.initState();
    startTypewriterEffect();
  }

  @override
  void dispose() {
    timer?.cancel();
    _scrollController.dispose(); // Dispose the ScrollController
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
      height: MediaQuery.of(context).size.height * 0.4,
      width: double.infinity,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: widget.theme["root"]!.backgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(6)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Scrollbar(
          thumbVisibility: true,
          controller: _scrollController,
          child: SingleChildScrollView(
            controller: _scrollController,
            child: HighlightView(
              displayedCode,
              language: widget.language,
              theme: widget.theme,
              padding: const EdgeInsets.all(12),
              textStyle: GoogleFonts.sourceCodePro(),
            ),
          ),
        ),
      ),
    );
  }
}
