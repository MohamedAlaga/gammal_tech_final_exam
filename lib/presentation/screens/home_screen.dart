import 'package:flutter/material.dart';
import 'package:gammal_tech_final_exam/presentation/components/card_info_home_page.dart';
import 'package:gammal_tech_final_exam/presentation/components/custom_button.dart';
import 'package:gammal_tech_final_exam/presentation/components/main_app_bar.dart';
import 'package:gammal_tech_final_exam/presentation/screens/course_screen.dart';
import 'package:gammal_tech_final_exam/presentation/screens/practice_screen.dart';
import 'package:gammal_tech_final_exam/presentation/screens/user_history.dart';

import '../components/card_continue_course.dart';
import '../components/course_card.dart';

List<List<dynamic>> continueCourse = [
  ['30/83 Quiz', 'C programming', 0.3, 'Continue', ''],
  ['15/83 Quiz', 'C++', 0.6, 'Continue', '']
];

List<List<dynamic>> course = [
  ['83 Quizzes', 'Data Structures', 'Structure Your Code!', 5.0, 15, 'Start'],
  ['83 Quizzes', 'Data Structures', 'Structure Your Code!', 4.0, 6, 'Start']
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        rightIcon: Icons.notifications_none,
        onNotificationPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UserHistory(),
            ),
          );
        },
        image:
            'https://media.licdn.com/dms/image/v2/D5603AQGyqO71BGTIQA/profile-displayphoto-shrink_400_400/profile-displayphoto-shrink_400_400/0/1724595865968?e=1733961600&v=beta&t=axj8aNdvToysiogWaZR7Fddi1NjwWSx82HAsviFNy2w',
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Center(
            child: Column(
              children: [
                CardInfoHomePage(
                  name: 'Mohamed',
                  solvedExams: 100,
                  rank: 1,
                  outOf: 2000,
                  points: 5000,
                ),
                SizedBox(height: 24),
                CustomButton(
                  text: 'Practice',
                  textColor: Colors.white,
                  buttonColor: Color(0xff094546),
                  borderColor: Color(0xff094546),
                  borderRadius: 8,
                  fontSize: 20,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CourseScreen(),
                      ),
                    );
                  },
                ),
                SizedBox(height: 24),
                const Row(
                  children: [
                    Text(
                      'Up next quizzes :',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff094546),
                        fontFamily: 'SourceSans3',
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                const SizedBox(height: 6),
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
                const Row(
                  children: [
                    Text(
                      'course suggestions :',
                      style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff094546),
                          fontFamily: 'SourceSans3',
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                  ],
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
