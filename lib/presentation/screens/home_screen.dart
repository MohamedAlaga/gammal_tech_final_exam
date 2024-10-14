import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gammal_tech_final_exam/core/utils/enums.dart';
import 'package:gammal_tech_final_exam/domain/entities/course.dart';
import 'package:gammal_tech_final_exam/presentation/components/card_exam.dart';
import 'package:gammal_tech_final_exam/presentation/components/card_info_home_page.dart';
import 'package:gammal_tech_final_exam/presentation/components/course_card.dart';
import 'package:gammal_tech_final_exam/presentation/components/custom_button.dart';
import 'package:gammal_tech_final_exam/presentation/components/main_app_bar.dart';
import 'package:gammal_tech_final_exam/presentation/components/nav_bar.dart';
import 'package:gammal_tech_final_exam/presentation/components/source_sans_text.dart';
import 'package:gammal_tech_final_exam/presentation/controller/courses_bloc.dart';
import 'package:gammal_tech_final_exam/presentation/controller/courses_events.dart';
import 'package:gammal_tech_final_exam/presentation/controller/courses_state.dart';
import 'package:gammal_tech_final_exam/presentation/controller/exams_bloc.dart';
import 'package:gammal_tech_final_exam/presentation/controller/exams_event.dart';
import 'package:gammal_tech_final_exam/presentation/controller/topics_bloc.dart';
import 'package:gammal_tech_final_exam/presentation/controller/topics_events.dart';
import 'package:gammal_tech_final_exam/presentation/controller/topics_state.dart';
import 'package:gammal_tech_final_exam/presentation/controller/user_bloc.dart';
import 'package:gammal_tech_final_exam/presentation/controller/user_state.dart';
import 'package:gammal_tech_final_exam/presentation/screens/course_screen.dart';
import 'package:gammal_tech_final_exam/presentation/screens/more_data_screen.dart';
import 'package:gammal_tech_final_exam/presentation/screens/practice_screen.dart';
import 'package:gammal_tech_final_exam/presentation/screens/quiz_page.dart';
import 'package:gammal_tech_final_exam/presentation/screens/user_history_screen.dart';

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
                MaterialPageRoute(
                  builder: (context) => const UserHistoryScreen(),
                ),
              );
            },
            image: state.welcomeData.imageUrl,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Center(
            child: Column(
              children: [
                BlocBuilder<UserBloc, UserState>(
                  builder: (context, state) => CardInfoHomePage(
                    name: state.welcomeData.title,
                    solvedExams: state.welcomeData.solvedExams,
                    rank: state.welcomeData.rank,
                    outOf: state.welcomeData.totalRanks,
                    points: state.welcomeData.points,
                  ),
                ),
                const SizedBox(height: 24),
                CustomButton(
                  text: 'Practice',
                  textColor: Colors.white,
                  buttonColor: const Color(0xff094546),
                  borderColor: const Color(0xff094546),
                  borderRadius: 8,
                  fontSize: 20,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => MultiBlocProvider(providers: [
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
                const SizedBox(height: 12),
                BlocBuilder<TopicsBloc, TopicsState>(builder: (context, state) {
                  switch (state.sugesstedRequestState) {
                    case RequestState.loading:
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    case RequestState.loaded:
                      print(state.sugesstedTopics);
                      print(state.sugesstedTopics.length);
                      print(state.sugesstedTopics[0].title);
                      return Column(
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: SourceSansText(text: "up next Topics :"),
                          ),
                          for (var topic in state.sugesstedTopics)
                            Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: CardExam(
                                courseImage: topic.imageUrl,
                                courseTitle: topic.title,
                                subtitle: topic.subtitle,
                                questions: "${topic.quizCount} Questions",
                                time: "${topic.duration.toString()} sec",
                                onMorePressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MultiBlocProvider(
                                          providers: [
                                            BlocProvider.value(
                                                value:
                                                    BlocProvider.of<ExamsBloc>(
                                                        context)),
                                            BlocProvider.value(
                                              value:
                                                  BlocProvider.of<TopicsBloc>(
                                                      context),
                                            ),
                                            BlocProvider.value(
                                              value: BlocProvider.of<UserBloc>(
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
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          MultiBlocProvider(providers: [
                                        BlocProvider.value(
                                            value: BlocProvider.of<ExamsBloc>(
                                                context)),
                                        BlocProvider.value(
                                          value: BlocProvider.of<TopicsBloc>(
                                              context),
                                        ),
                                        BlocProvider.value(
                                          value: BlocProvider.of<UserBloc>(
                                              context),
                                        )
                                      ], child: QuizPage()),
                                    ),
                                  );
                                },
                              ),
                            )
                        ],
                      );
                    case RequestState.error:
                      return Center(
                        child: Text(state.sugesstedErrorMessage),
                      );
                  }
                }),
                const SizedBox(height: 24),
                const SizedBox(height: 12),
                BlocBuilder<CoursesBloc, CoursesState>(
                    builder: (context, state) {
                  switch (state.suggestedCoursesRequestState) {
                    case RequestState.loading:
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    case RequestState.loaded:
                      List<Course> courses = state.suggestedCourses;
                      return Column(
                        children: [
                          courses.isNotEmpty
                              ? const Align(
                                  alignment: Alignment.centerLeft,
                                  child: SourceSansText(
                                      text: "Course Suggestions :"),
                                )
                              : const SizedBox(),
                          for (var course in courses)
                            Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: CourseCard(
                                quizzes: "${course.quizzes.toString()} Quizzes",
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
                                      MaterialPageRoute(
                                        builder: (context) => MultiBlocProvider(
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
                            )
                        ],
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
        ),
      ),
      bottomNavigationBar: NavBar(currentIndex: 0),
    );
  }
}
