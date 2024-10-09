import 'package:flutter/material.dart';
import 'package:gammal_tech_final_exam/presentation/components/card_continue_course.dart';
import 'package:gammal_tech_final_exam/presentation/components/card_course.dart';
import 'package:gammal_tech_final_exam/presentation/components/custom_appbar.dart';

class CourseScreen extends StatelessWidget {
  CourseScreen({super.key});

  List<List<dynamic>> continueCourse = [
    ['30/83 Quiz', 'C programming', 0.3, 'Continue', 'assets/login_photo.png'],
    ['15/83 Quiz', 'C++', 0.6, 'Continue', 'assets/login_photo.png'],
    ['5/83 Quiz', 'Dart', 0.9, 'Continue', 'assets/login_photo.png']
  ];

  List<List<dynamic>> course = [
    ['83 Quizzes', 'Data Structures', 'Structure Your Code!', 4.0, 15, 'Start'],
    ['83 Quizzes', 'Data Structures', 'Structure Your Code!', 4.0, 15, 'Start'],
    ['83 Quizzes', 'Data Structures', 'Structure Your Code!', 4.0, 15, 'Start']
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isProfileVisible: true,
        leftIcon: Icons.navigate_before,
        rightIcon: Icons.notifications,
        onLeftIconPressed: () {},
        onRightIconPressed: () {},
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24),
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
                  CardCourse(
                    quizzes: course[i][0],
                    courseTitle: course[i][1],
                    subtitle: course[i][2],
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
