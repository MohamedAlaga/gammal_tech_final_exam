import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gammal_tech_final_exam/core/utils/enums.dart';
import 'package:gammal_tech_final_exam/domain/entities/topic.dart';
import 'package:gammal_tech_final_exam/presentation/components/card_can_not_start_exam.dart';
import 'package:gammal_tech_final_exam/presentation/components/card_exam.dart';
import 'package:gammal_tech_final_exam/presentation/components/card_finish_exam_course.dart';
import 'package:gammal_tech_final_exam/presentation/components/shimmers.dart';
import 'package:gammal_tech_final_exam/presentation/components/sub_app_bar.dart';
import 'package:gammal_tech_final_exam/presentation/controller/courses_bloc.dart';
import 'package:gammal_tech_final_exam/presentation/controller/exams_bloc.dart';
import 'package:gammal_tech_final_exam/presentation/controller/exams_event.dart';
import 'package:gammal_tech_final_exam/presentation/controller/topics_bloc.dart';
import 'package:gammal_tech_final_exam/presentation/controller/topics_state.dart';
import 'package:gammal_tech_final_exam/presentation/screens/more_data_screen.dart';
import 'package:gammal_tech_final_exam/presentation/screens/quiz_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class PracticeScreen extends StatelessWidget {
  const PracticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const SubAppBar(
          appBarColor: Colors.white,
          iconsColor: Color(0xff094546),
        ),
        backgroundColor: Colors.white,
        body: BlocBuilder<TopicsBloc, TopicsState>(builder: (context, state) {
          switch (state.topicsRequestState) {
            case RequestState.loading:
              return const Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CardFinishExamCourseShimmer(),
                        SizedBox(
                          height: 12,
                        ),
                        CardContinueCourseShimmer(),
                        SizedBox(
                          height: 12,
                        ),
                        CardFinishExamCourseShimmer(),
                        SizedBox(
                          height: 12,
                        ),
                        CardFinishExamCourseShimmer(),
                        SizedBox(
                          height: 12,
                        ),
                        CardFinishExamCourseShimmer(),
                        SizedBox(
                          height: 12,
                        ),
                        CardFinishExamCourseShimmer(),
                        SizedBox(
                          height: 12,
                        ),
                        CardFinishExamCourseShimmer(),
                        SizedBox(
                          height: 12,
                        ),
                        CardFinishExamCourseShimmer(),
                      ],
                    ),
                  ),
                ),
              );
            case RequestState.error:
              return const Center(
                child: Text('Error'),
              );
            case RequestState.loaded:
              if (state.topics.isNotEmpty) {
                List<Topic> finishedTopics = state.topics
                    .where((element) => element.isCompleted == true)
                    .toList();
                List<Topic> notFinishedTopics = state.topics.where((element) {
                  return element.isCompleted == false;
                }).toList();
                return FadeInRight(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Center(
                        child: Column(
                          children: [
                            for (int i = 0; i < finishedTopics.length; i++)
                              CardFinishExamCourse(
                                quizzes: "${i + 1}- ${finishedTopics[i].title}",
                                courseTitle:
                                    '${finishedTopics[i].quizCount.toString()} Questions',
                              ),
                            CardExam(
                              questions:
                                  "${finishedTopics.length + 1}- ${notFinishedTopics[0].title}",
                              courseTitle:
                                  "${notFinishedTopics[0].quizCount.toString()} Questions",
                              subtitle: notFinishedTopics[0].subtitle,
                              time:
                                  "${notFinishedTopics[0].duration.toString()} sec",
                              courseImage: notFinishedTopics[0].imageUrl,
                              onMorePressed: () {
                                Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      transitionDuration:
                                          const Duration(milliseconds: 140),
                                      transitionsBuilder: (context,
                                          firstAnimation,
                                          secondaryAnimation,
                                          child) {
                                        return SlideTransition(
                                          position: Tween<Offset>(
                                            begin: const Offset(1.0, 0.0),
                                            end: Offset.zero,
                                          ).animate(firstAnimation),
                                          child: child,
                                        );
                                      },
                                      pageBuilder: (context, firstAnimation,
                                              secondaryAnimation) =>
                                          MultiBlocProvider(
                                        providers: [
                                          BlocProvider.value(
                                              value:
                                                  BlocProvider.of<CoursesBloc>(
                                                      context)),
                                          BlocProvider.value(
                                              value:
                                                  BlocProvider.of<TopicsBloc>(
                                                      context))
                                        ],
                                        child: MoreDataScreen(
                                          description:
                                              notFinishedTopics[0].description,
                                          imageUrl:
                                              notFinishedTopics[0].imageUrl,
                                          neededSkills:
                                              notFinishedTopics[0].skills,
                                          points: notFinishedTopics[0]
                                              .points
                                              .toString(),
                                          quizId: notFinishedTopics[0].id,
                                          duration:
                                              notFinishedTopics[0].duration,
                                        ),
                                      ),
                                    ));
                              },
                              onStartPressed: () {
                                BlocProvider.of<ExamsBloc>(context).add(
                                    FetchQuestionsEvent(notFinishedTopics[0].id,
                                        notFinishedTopics[0].duration));

                                PersistentNavBarNavigator.pushNewScreen(
                                  context,
                                  screen: QuizPage(),
                                  withNavBar: false,
                                );
                              },
                            ),
                            for (int i = 1; i < notFinishedTopics.length; i++)
                              CardCanNotStartExam(
                                quizzes: "${finishedTopics.length+1+i}- ${notFinishedTopics[i].title}",
                                courseTitle:
                                    "${notFinishedTopics[i].quizCount.toString()} Questions",
                                courseImage: notFinishedTopics[i].imageUrl,
                                fontFamily: 'SourceSans3',
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              } else {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/not_fond.png',
                        width: 256,
                      ),
                      const Text(
                        'No exams in this course',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'SourceSans3',
                          fontWeight: FontWeight.w600,
                          color: Color(0xff094546),
                        ),
                      ),
                    ],
                  ),
                );
              }
          }
        }));
  }
}
