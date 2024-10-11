import 'package:flutter/material.dart';
import 'package:gammal_tech_final_exam/presentation/components/card_continue_course.dart';
import 'package:gammal_tech_final_exam/presentation/screens/practice_screen.dart';

import '../components/course_card.dart';
import '../components/sub_app_bar.dart';

List<List<dynamic>> continueCourse = [
  ['30/83 Quiz', 'C programming', 0.3, 'Continue', ''],
  ['15/83 Quiz', 'C++', 0.6, 'Continue', ''],
  ['5/83 Quiz', 'Dart', 0.9, 'Continue', '']
];

List<List<dynamic>> course = [
  ['83 Quizzes', 'Data Structures', 'Structure Your Code!', 5.0, 15, 'Start'],
  ['83 Quizzes', 'Data Structures', 'Structure Your Code!', 4.0, 6, 'Start'],
  ['83 Quizzes', 'Data Structures', 'Structure Your Code!', 2.5, 10, 'Start']
];

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SubAppBar(
        rightIcon: Icons.notifications_none,
        onRightIconPressed: () {},
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Progress :',
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff094546),
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 12),
                for (int i = 0; i < continueCourse.length; i++)
                  CardContinueCourse(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PracticeScreen(),
                        ),
                      );
                    },
                    quizzes: continueCourse[i][0],
                    courseTitle: continueCourse[i][1],
                    progress: continueCourse[i][2],
                    buttonText: continueCourse[i][3],
                    courseImage: continueCourse[i][4],
                  ),
                const SizedBox(height: 24),
                const Text(
                  'Recommended :',
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff094546),
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 12),
                for (int i = 0; i < course.length; i++)
                  CourseCard(
                    quizzes: course[i][0],
                    courseTitle: course[i][1],
                    subtitle: course[i][2],
                    image: '',
                    rating: course[i][3],
                    ratingCount: course[i][4],
                    buttonText: course[i][5],
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
