import 'package:flutter/material.dart';
import 'package:gammal_tech_final_exam/presentation/components/card_can_not_start_exam.dart';
import 'package:gammal_tech_final_exam/presentation/components/card_exam.dart';
import 'package:gammal_tech_final_exam/presentation/components/card_finish_exam_course.dart';

import '../components/custom_appbar.dart';

List<List<dynamic>> finishExamCourse = [
  ['6 Questions', 'printf', 'assets/course.png'],
  ['6 Questions', 'scanf', 'assets/course.png'],
  ['6 Questions', 'if condition', 'assets/course.png']
];

List<dynamic> cardExam = [
  '6 Questions',
  'printf(“gammal tech”);',
  'Master programming basics',
  '10sec',
  'assets/course.png',
];

class PracticeScreen extends StatelessWidget {
  const PracticeScreen({super.key});

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
          padding: const EdgeInsets.all(24),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (int i = 0; i < finishExamCourse.length; i++)
                  CardFinishExamCourse(
                    quizzes: finishExamCourse[i][0],
                    courseTitle: finishExamCourse[i][1],
                  ),
                CardExam(
                  questions: cardExam[0],
                  courseTitle: cardExam[1],
                  subtitle: cardExam[2],
                  time: cardExam[3],
                  courseImage: cardExam[6],
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
