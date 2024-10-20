import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gammal_tech_final_exam/presentation/components/custom_button.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({
    super.key,
    required this.quizzes,
    required this.courseTitle,
    required this.subtitle,
    required this.image,
    required this.rating,
    this.ratingCount,
    required this.buttonText,
    this.onTap,
    this.fontFamily = 'SourceSans3',
  });

  final int quizzes;
  final String courseTitle;
  final String subtitle;
  final String image;
  final double rating;
  final int? ratingCount;
  final String buttonText;
  final void Function()? onTap;
  final String fontFamily;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xffE3E5E8), width: 1),
          ),
          child: Padding(
            padding: const EdgeInsets.all(1),
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          child: Text(
                            "$quizzes Quizzes",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Quicksand',
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
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: fontFamily,
                                  color: const Color(0xff094546)),
                            ),
                            Text(
                              subtitle,
                              style: TextStyle(
                                  fontFamily: fontFamily,
                                  color:
                                      const Color(0xff094546).withOpacity(0.6)),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                RatingBar.builder(
                                  initialRating: rating,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemSize: 20.0,
                                  ignoreGestures: true,
                                  itemBuilder: (context, index) => Icon(
                                    Icons.star,
                                    color: index < rating
                                        ? Colors.amber
                                        : const Color(0xffEBEBEC),
                                  ),
                                  onRatingUpdate: (rating) {},
                                ),
                                const SizedBox(width: 5),
                                if (ratingCount != null)
                                  Text(
                                    '($ratingCount)',
                                    style: TextStyle(
                                        fontFamily: fontFamily,
                                        color: const Color(0xff094546)
                                            .withOpacity(0.6)),
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
                  padding:
                      const EdgeInsets.only(top: 24, right: 12, bottom: 12),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: _getImageProvider(image),
                            fit: BoxFit.cover,
                          ),
                        ),
                        width: 48,
                        height: 56,
                      ),
                      const SizedBox(height: 18),
                      CustomButton(
                        text: buttonText,
                        textColor: Colors.white,
                        buttonColor: const Color(0xff094546),
                        borderColor: const Color(0xff094546),
                        width: 80,
                        borderRadius: 3,
                        fontSize: 16,
                        onTap: onTap ?? () {},
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
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
