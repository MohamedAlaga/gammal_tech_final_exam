import 'package:flutter/material.dart';

class CardCanNotStartExam extends StatelessWidget {
  final String quizzes;
  final String courseTitle;
  final String courseImage;
  final void Function()? onTap;
  final String fontFamily;

  const CardCanNotStartExam({
    super.key,
    required this.quizzes,
    required this.courseTitle,
    required this.courseImage,
    this.onTap,
    this.fontFamily = 'SourceSans3',
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 160, 164, 168),
          border: Border.all(
              color: const Color.fromARGB(255, 160, 164, 168), width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              // Ensure the text adjusts dynamically
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    child: Text(
                      courseTitle,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Quicksand',
                        color: Color.fromARGB(255, 160, 164, 168),
                      ),
                      maxLines: 1, // Ensure it stays on one line
                      overflow: TextOverflow.ellipsis, // Handle overflow
                    ),
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.only(left: 12, bottom: 12),
                    child: Text(
                      "$quizzes Questions",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily: fontFamily,
                        color: Colors.white,
                      ),
                      maxLines: 1, // Ensure single line
                      overflow: TextOverflow.ellipsis, // Handle overflow
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 12, top: 6),
              child: Stack(
                children: [
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
                  Container(
                    color: const Color.fromARGB(255, 160, 164, 168)
                        .withOpacity(0.5),
                    width: 48,
                    height: 56,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ImageProvider _getImageProvider(String imageUrl) {
    if (imageUrl.isNotEmpty) {
      try {
        return NetworkImage(imageUrl);
      } catch (e) {
        return const AssetImage('assets/course.png'); // fallback image
      }
    } else {
      return const AssetImage('assets/course.png'); // fallback image
    }
  }
}
