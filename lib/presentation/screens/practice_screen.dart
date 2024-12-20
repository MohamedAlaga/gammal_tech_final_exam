import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gammal_tech_final_exam/core/services/service_locator.dart';
import 'package:gammal_tech_final_exam/core/utils/enums.dart';
import 'package:gammal_tech_final_exam/domain/entities/topic.dart';
import 'package:gammal_tech_final_exam/domain/usecase/check_user_attempts_usecase.dart';
import 'package:gammal_tech_final_exam/presentation/components/accept_custom_dialoge.dart';
import 'package:gammal_tech_final_exam/presentation/components/card_can_not_start_exam.dart';
import 'package:gammal_tech_final_exam/presentation/components/card_finish_exam_course.dart';
import 'package:gammal_tech_final_exam/presentation/components/custom_toast.dart';
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

import '../components/practice_card_exam.dart';

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
                                courseNumber: i + 1,
                                courseTitle: finishedTopics[i].title,
                              ),
                            PracticeCardExam(
                              courseNumber: finishedTopics.length + 1,
                              courseTitle: notFinishedTopics[0].title,
                              subtitle: notFinishedTopics[0].subtitle,
                              time: notFinishedTopics[0].duration,
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
                              onStartPressed: () async {
                                showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (BuildContext dialogContext) {
                                    return const Center(
                                      child: SizedBox(
                                        height: 36,
                                        width: 36,
                                        child: CircularProgressIndicator(),
                                      ),
                                    );
                                  },
                                );
                                var result =
                                    await sl<CheckUserAttemptsUsecase>()
                                        .execute();
                                Navigator.of(context, rootNavigator: true)
                                    .pop();
                                result.fold(
                                  (failure) {
                                    showRedToast(
                                        "Error occured while checking attempts remaning");
                                  },
                                  (hasAttemptsLeft) {
                                    if (hasAttemptsLeft) {
                                      BlocProvider.of<ExamsBloc>(context).add(
                                          FetchQuestionsEvent(
                                              notFinishedTopics[0].id,
                                              notFinishedTopics[0].duration));

                                      PersistentNavBarNavigator.pushNewScreen(
                                        context,
                                        screen: QuizPage(),
                                        withNavBar: false,
                                      );
                                    } else {
                                      showGeneralDialog(
                                        context: context,
                                        transitionDuration:
                                            const Duration(milliseconds: 300),
                                        barrierDismissible: true,
                                        barrierLabel: '',
                                        transitionBuilder:
                                            (context, a1, a2, widget) {
                                          final curvedValue = Curves
                                                  .easeInOutBack
                                                  .transform(a1.value) -
                                              1.0;
                                          return Transform(
                                            transform:
                                                Matrix4.translationValues(0.0,
                                                    curvedValue * 200, 0.0),
                                            child: Opacity(
                                              opacity: a1.value,
                                              child: AcceptCustomDialoge(
                                                onTap: () {
                                                  Navigator.pop(
                                                      context); // Close the custom dialog
                                                },
                                                body:
                                                    "You do not have any attempts left",
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          );
                                        },
                                        pageBuilder:
                                            (context, animation1, animation2) {
                                          return const SizedBox();
                                        },
                                      );
                                    }
                                  },
                                );
                              },
                            ),
                            for (int i = 1; i < notFinishedTopics.length; i++)
                              CardCanNotStartExam(
                                courseNumber: finishedTopics.length + 1 + i,
                                courseTitle: notFinishedTopics[i].title,
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
