import 'package:flutter/material.dart';
import 'package:gammal_tech_final_exam/presentation/components/card_can_not_start_exam.dart';
import 'package:gammal_tech_final_exam/presentation/components/card_exam.dart';
import 'package:gammal_tech_final_exam/presentation/components/card_finish_exam_course.dart';
import 'package:gammal_tech_final_exam/presentation/components/sub_app_bar.dart';

List<List<dynamic>> finishExamCourse = [
  ['6 Questions', 'printf'],
  ['6 Questions', 'scanf'],
  ['6 Questions', 'if condition']
];

List<List<dynamic>> ExamCourse = [
  ['6 Questions', 'printf', ''],
  ['6 Questions', 'scanf', ''],
  ['6 Questions', 'if condition', '']
];

List<dynamic> cardExam = [
  '6 Questions',
  'printf(“gammal tech”);',
  'Master programming basics',
  '10sec',
  '',
];

class PracticeScreen extends StatelessWidget {
  const PracticeScreen({super.key});

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
                  courseImage: cardExam[4],
                ),
                for (int i = 0; i < ExamCourse.length; i++)
                  CardCanNotStartExam(
                    quizzes: ExamCourse[i][0],
                    courseTitle: ExamCourse[i][1],
                    courseImage: ExamCourse[i][2],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
