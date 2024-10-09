import 'package:flutter/material.dart';
import 'package:gammal_tech_final_exam/presentation/components/card_can_not_start_exam.dart';
import 'package:gammal_tech_final_exam/presentation/components/card_exam.dart';
import 'package:gammal_tech_final_exam/presentation/components/card_finish_exam_course.dart';

import '../components/custom_appbar.dart';

class PracticeScreen extends StatelessWidget {
  PracticeScreen({super.key});

  List<List<dynamic>> finishExamCourse = [
    ['6 Questions', 'C programming', 'assets/login_photo.png'],
    ['6 Questions', 'C programming', 'assets/login_photo.png'],
    ['6 Questions', 'C programming', 'assets/login_photo.png']
  ];

  List<dynamic> cardExam = [
    '6 Questions',
    'printf(“gammal tech”);',
    'Master programming basics',
    '10sec',
    'More',
    'Start',
    'assets/login_photo.png',
    'assets/login_photo.png'
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
                for (int i = 0; i < finishExamCourse.length; i++)
                  CardFinishExamCourse(
                    quizzes: finishExamCourse[i][0],
                    courseTitle: finishExamCourse[i][1],
                    courseImage: finishExamCourse[i][2],
                  ),
                CardExam(
                  questions: cardExam[0],
                  courseTitle: cardExam[1],
                  subtitle: cardExam[2],
                  time: cardExam[3],
                  buttonMoreText: cardExam[4],
                  buttonStartText: cardExam[5],
                  courseImage: cardExam[6],
                  timerImage: cardExam[7],
                ),
                for (int i = 0; i < finishExamCourse.length; i++)
                  CardCanNotStartExam(
                    quizzes: finishExamCourse[i][0],
                    courseTitle: finishExamCourse[i][1],
                    courseImage: finishExamCourse[i][2],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
