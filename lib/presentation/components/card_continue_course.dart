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
                        fontFamily: 'Quicksand',
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
                          fontFamily: 'SourceSans3',
                          color: Color(0xff094546)),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 12, top: 12),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: _getImageProvider(courseImage),
                      fit: BoxFit.cover,
                    ),
                  ),
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
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                        12), // Circular border with a radius of 12
                    child: LinearProgressIndicator(
                      value: progress,
                      minHeight: 8,
                      backgroundColor: Colors.grey.shade300,
                      valueColor: const AlwaysStoppedAnimation<Color>(
                          Color(0xffFF904D)),
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  '${(progress * 100).toInt()}%',
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Quicksand', // Use SourceSans3
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
              width: double.infinity,
              borderRadius: 3,
              fontSize: 16,
              onTap: onTap ?? () {},
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
