import 'package:flutter/material.dart';
import 'package:gammal_tech_final_exam/presentation/components/custom_button.dart';

class CardExam extends StatelessWidget {
  final String questions;
  final String courseTitle;
  final String subtitle;
  final String time;
  final String courseImage;
  final void Function()? onMorePressed;
  final void Function()? onStartPressed;

  const CardExam({
    super.key,
    required this.questions,
    required this.courseTitle,
    required this.subtitle,
    required this.time,
    required this.courseImage,
    this.onMorePressed,
    this.onStartPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.transparent,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(
          color: Color(0xffE3E5E8),
          width: 1,
        ),
      ),
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
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Quicksand',
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/timer.png',
                      width: 25,
                      height: 28,
                    ),
                    Text(
                      time,
                      style: const TextStyle(
                        fontSize: 20,
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.w600,
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
                        fontFamily: 'SourceSans3',
                        color: Color(0xff094546),
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'SourceSans3',
                        color: const Color(0xff094546).withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: _getImageProvider(courseImage),
                      fit: BoxFit.cover,
                    ),
                  ),
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
                  text: 'More',
                  textColor: Colors.white,
                  buttonColor: const Color(0xff094546),
                  borderColor: const Color(0xff094546),
                  width: 85,
                  borderRadius: 3,
                  fontSize: 16,
                  onTap: onMorePressed ?? () {},
                ),
                const Spacer(),
                CustomButton(
                  text: 'Start',
                  textColor: Colors.white,
                  buttonColor: const Color(0xff094546),
                  borderColor: const Color(0xff094546),
                  width: 85,
                  borderRadius: 3,
                  fontSize: 16,
                  onTap: onStartPressed ?? () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ImageProvider _getImageProvider(String imageUrl) {
    try {
      if (imageUrl.isNotEmpty) {
        return NetworkImage(imageUrl);
      } else {
        return const AssetImage('assets/course.png');
      }
    } catch (e) {
      return const AssetImage('assets/course.png');
    }
  }
}
