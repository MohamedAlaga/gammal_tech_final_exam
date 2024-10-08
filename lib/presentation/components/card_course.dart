import 'package:flutter/material.dart';
import 'package:gammal_tech_final_exam/presentation/components/custom_button.dart';

class CardCourse extends StatelessWidget {
  final String quizzes;
  final String courseTitle;
  final String subtitle;
  final double rating;
  final int ratingCount;
  final String buttonText;
  final void Function()? onTap;

  CardCourse({
    required this.quizzes,
    required this.courseTitle,
    required this.subtitle,
    required this.rating,
    required this.ratingCount,
    required this.buttonText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
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
                  child: Padding(
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
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        courseTitle,
                        style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff094546)),
                      ),
                      Text(
                        subtitle,
                        style: const TextStyle(color: Color(0xff094546)),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Row(
                            children: List.generate(5, (index) {
                              return Icon(
                                index < rating ? Icons.star : Icons.star_border,
                                color: Colors.amber,
                              );
                            }),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            '($ratingCount)',
                            style: const TextStyle(color: Color(0xff094546)),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Image.asset(
                  'assets/img.png',
                  width: 48,
                  height: 56,
                ),
                const SizedBox(height: 32),
                CustomButton(
                  text: buttonText,
                  textColor: Colors.white,
                  buttonColor: Color(0xff094546),
                  borderColor: Color(0xff094546),
                  height: 30,
                  width: 80,
                  borderRadius: 8,
                  onTap: onTap ?? () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
