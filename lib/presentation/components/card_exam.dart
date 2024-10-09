import 'package:flutter/material.dart';
import 'package:gammal_tech_final_exam/presentation/components/custom_button.dart';

class CardExam extends StatelessWidget {
  final String questions;
  final String courseTitle;
  final String subtitle;
  final String time;
  final String buttonMoreText;
  final String buttonStartText;
  final String courseImage;
  final String timerImage;
  final void Function()? onMorePressed;
  final void Function()? onStartPressed;

  const CardExam({
    super.key,
    required this.questions,
    required this.courseTitle,
    required this.subtitle,
    required this.time,
    required this.buttonMoreText,
    required this.buttonStartText,
    required this.courseImage,
    required this.timerImage,
    this.onMorePressed,
    this.onStartPressed,
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  questions,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Row(
                  children: [
                    Image.asset(
                      timerImage,
                      width: 25,
                      height: 28,
                    ),
                    Text(
                      time,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Color(0xff094546),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      courseTitle,
                      style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff094546)),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Image.asset(
                  courseImage,
                  width: 48,
                  height: 56,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                CustomButton(
                  text: buttonMoreText,
                  textColor: Colors.white,
                  buttonColor: const Color(0xff094546),
                  borderColor: const Color(0xff094546),
                  height: 30,
                  width: 83,
                  borderRadius: 3,
                  onTap: onMorePressed ?? () {},
                ),
                const Spacer(),
                CustomButton(
                  text: buttonStartText,
                  textColor: Colors.white,
                  buttonColor: const Color(0xff094546),
                  borderColor: const Color(0xff094546),
                  height: 30,
                  width: 83,
                  borderRadius: 3,
                  onTap: onStartPressed ?? () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
