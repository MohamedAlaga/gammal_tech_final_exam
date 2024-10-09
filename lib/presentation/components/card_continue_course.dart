import 'package:flutter/material.dart';
import 'package:gammal_tech_final_exam/presentation/components/custom_button.dart';

class CardContinueCourse extends StatelessWidget {
  final String quizzes;
  final String courseTitle;
  final double progress;
  final String buttonText;
  final String courseImage;
  final void Function()? onTap;

  const CardContinueCourse({
    super.key,
    required this.quizzes,
    required this.courseTitle,
    required this.progress,
    required this.buttonText,
    required this.courseImage,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xffFF904D),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    child: Text(
                      quizzes,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Text(
                      courseTitle,
                      style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff094546)),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 12, top: 12),
                child: Image.asset(
                  courseImage,
                  width: 48,
                  height: 56,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Expanded(
                  child: LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.grey.shade300,
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Color(0xffFF904D)),
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  '${(progress * 100).toInt()}%',
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff094546)),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: CustomButton(
              text: buttonText,
              textColor: Colors.white,
              buttonColor: const Color(0xff094546),
              borderColor: const Color(0xff094546),
              height: 40,
              width: double.infinity,
              borderRadius: 3,
              onTap: onTap ?? () {},
            ),
          ),
        ],
      ),
    );
  }
}
