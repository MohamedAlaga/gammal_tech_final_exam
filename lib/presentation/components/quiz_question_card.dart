import 'package:flutter/material.dart';
import 'package:gammal_tech_final_exam/presentation/components/fira_code_text.dart';

class QuizAnswerCard extends StatelessWidget {
  const QuizAnswerCard({super.key ,required this.content});
  final String content ;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration:  BoxDecoration(
          color: const Color(0xFFEAEAEA),
          borderRadius: const BorderRadius.all(Radius.circular(6)),
          border: Border.all(width: 1 ,color: const Color(0xFFFF904D))
        ),
        child: Padding(
          padding: const EdgeInsets.all(8
          ),
          child: FiraCodeText(
            text: content,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF094546),
            textAlign: TextAlign.left,
          ),
        ));
  }
}
