import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gammal_tech_final_exam/presentation/components/welcome_info_new.dart';
import 'package:gammal_tech_final_exam/presentation/screens/practice_screen.dart';
import 'package:gammal_tech_final_exam/presentation/screens/quiz_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../core/utils/enums.dart';
import '../../domain/entities/course.dart';
import '../components/card_exam.dart';
import '../components/course_card.dart';
import '../components/custom_button.dart';
import '../components/main_app_bar.dart';
import '../components/shimmers.dart';
import '../components/source_sans_text.dart';
import '../controller/courses_bloc.dart';
import '../controller/courses_events.dart';
import '../controller/courses_state.dart';
import '../controller/exams_bloc.dart';
import '../controller/exams_event.dart';
import '../controller/topics_bloc.dart';
import '../controller/topics_events.dart';
import '../controller/topics_state.dart';
import '../controller/user_bloc.dart';
import '../controller/user_state.dart';
import 'course_screen.dart';
import 'more_data_screen.dart';
import 'notification_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CoursesBloc>(context).add(FetchSuggestedCoursesEvent());
    BlocProvider.of<TopicsBloc>(context).add(FetchSuggestedTopicsEvent());
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(52),
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) => MainAppBar(
            rightIcon: Icons.notifications_none,
            onNotificationPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  transitionDuration: const Duration(milliseconds: 140),
                  transitionsBuilder:
                      (context, firstAnimation, secondaryAnimation, child) {
                    return SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(1.0, 0.0),
                        end: Offset.zero,
                      ).animate(firstAnimation),
                      child: child,
                    );
                  },
                  pageBuilder: (context, firstAnimation, secondaryAnimation) =>
                      const NotificationScreen(),
                ),
              );
            },
            appBarrColor: const Color(0xff094546),
            rightIconColor: Colors.white,
            image: state.welcomeData.imageUrl,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<UserBloc, UserState>(
              builder: (context, state) => WelcomeInfoNew(
                name: state.welcomeData.title,
                card1: state.welcomeData.solvedExams,
                card2Text1: state.welcomeData.rank,
                card2Text2: state.welcomeData.totalRanks,
                card3: state.welcomeData.points,
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomButton(
                    text: 'Practice',
                    textColor: Colors.white,
                    buttonColor: const Color(0xff094546),
                    borderColor: const Color(0xff094546),
                    borderRadius: 8,
                    fontSize: 20,
                    onTap: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          transitionDuration: const Duration(milliseconds: 140),
                          transitionsBuilder: (context, firstAnimation,
                              secondaryAnimation, child) {
                            return SlideTransition(
                              position: Tween<Offset>(
                                begin: const Offset(1.0, 0.0),
                                end: Offset.zero,
                              ).animate(firstAnimation),
                              child: child,
                            );
                          },
                          pageBuilder:
                              (context, firstAnimation, secondaryAnimation) =>
                                  MultiBlocProvider(providers: [
                            BlocProvider.value(
                                value: BlocProvider.of<CoursesBloc>(context)),
                            BlocProvider.value(
                              value: BlocProvider.of<TopicsBloc>(context),
                            )
                          ], child: const CourseScreen()),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                  BlocBuilder<TopicsBloc, TopicsState>(
                      builder: (context, state) {
                    switch (state.sugesstedRequestState) {
                      case RequestState.loading:
                        return const Column(children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: TextShimmer()),
                          SizedBox(height: 24),
                          TopicCardShimmer()
                        ]);
                      case RequestState.loaded:
                        return FadeIn(
                          child: Column(
                            children: [
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: SourceSansText(text: "Up next topics :"),
                              ),
                              const SizedBox(height: 12),
                              for (var topic in state.sugesstedTopics)
                                CardExam(
                                  courseImage: topic.imageUrl,
                                  courseTitle: topic.title,
                                  subtitle: topic.subtitle,
                                  questions: topic.quizCount.toString(),
                                  time: "${topic.duration.toString()} sec",
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
                                                  value: BlocProvider.of<
                                                      ExamsBloc>(context)),
                                              BlocProvider.value(
                                                value:
                                                    BlocProvider.of<TopicsBloc>(
                                                        context),
                                              ),
                                              BlocProvider.value(
                                                value:
                                                    BlocProvider.of<UserBloc>(
                                                        context),
                                              )
                                            ],
                                            child: MoreDataScreen(
                                              description: topic.description,
                                              imageUrl: topic.imageUrl,
                                              neededSkills: topic.skills,
                                              points: topic.points.toString(),
                                              quizId: topic.id,
                                              duration: topic.duration,
                                            ),
                                          ),
                                        ));
                                  },
                                  onStartPressed: () {
                                    BlocProvider.of<ExamsBloc>(context).add(
                                        FetchQuestionsEvent(
                                            topic.id, topic.duration));
                                    PersistentNavBarNavigator.pushNewScreen(
                                      context,
                                      screen: QuizPage(),
                                      withNavBar: false,
                                    );
                                  },
                                ),
                            ],
                          ),
                        );
                      case RequestState.error:
                        return Center(
                          child: Text(state.sugesstedErrorMessage),
                        );
                    }
                  }),
                  const SizedBox(height: 12),
                  BlocBuilder<CoursesBloc, CoursesState>(
                      builder: (context, state) {
                    switch (state.suggestedCoursesRequestState) {
                      case RequestState.loading:
                        return const Column(children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: TextShimmer()),
                          SizedBox(
                            height: 12,
                          ),
                          CourseCardShimmer()
                        ]);
                      case RequestState.loaded:
                        List<Course> courses = state.suggestedCourses;
                        return FadeIn(
                          child: Column(
                            children: [
                              courses.isNotEmpty
                                  ? const Align(
                                      alignment: Alignment.centerLeft,
                                      child: SourceSansText(
                                          text: "Course Suggestions :"),
                                    )
                                  : const SizedBox(),
                              for (var course in courses)
                                CourseCard(
                                  quizzes: course.quizzes,
                                  courseTitle: course.name,
                                  subtitle: course.description,
                                  image: course.imageUrl,
                                  rating: course.rating,
                                  buttonText: 'Start',
                                  onTap: () {
                                    BlocProvider.of<CoursesBloc>(context)
                                        .add(EnrollToCourseEvent(course.id));

                                    BlocProvider.of<TopicsBloc>(context).add(
                                        FetchTopicsEvent(courseId: course.id));
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
                                                  value: BlocProvider.of<
                                                      CoursesBloc>(context)),
                                              BlocProvider.value(
                                                value:
                                                    BlocProvider.of<TopicsBloc>(
                                                        context),
                                              )
                                            ],
                                            child: const PracticeScreen(),
                                          ),
                                        ));
                                  },
                                ),
                            ],
                          ),
                        );
                      case RequestState.error:
                        return Center(
                          child: Text(state.suggestedCoursesErrorMessage),
                        );
                    }
                  })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
