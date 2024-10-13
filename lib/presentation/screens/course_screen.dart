import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gammal_tech_final_exam/domain/entities/course.dart';
import 'package:gammal_tech_final_exam/presentation/components/card_continue_course.dart';
import 'package:gammal_tech_final_exam/presentation/controller/courses_bloc.dart';
import 'package:gammal_tech_final_exam/presentation/controller/courses_events.dart';
import 'package:gammal_tech_final_exam/presentation/controller/courses_state.dart';
import 'package:gammal_tech_final_exam/presentation/controller/topics_bloc.dart';
import 'package:gammal_tech_final_exam/presentation/controller/topics_events.dart';
import 'package:gammal_tech_final_exam/presentation/screens/practice_screen.dart';
import 'package:gammal_tech_final_exam/core/utils/enums.dart';

import '../components/course_card.dart';
import '../components/sub_app_bar.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CoursesBloc>(context).add(FetchAllCoursesEvent());
    return Scaffold(
      appBar: SubAppBar(
        rightIcon: Icons.notifications_none,
        onRightIconPressed: () {},
      ),
      backgroundColor: Colors.white,
      body: BlocBuilder<CoursesBloc, CoursesState>(
        builder: (context, state) {
          switch (state.allCoursesRequestState) {
            case RequestState.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case RequestState.error:
              return const Center(
                child: Text('Error'),
              );
            case RequestState.loaded:
              List<Course> enrolledCourses = state.allCourses
                  .where((element) => element.isEnrolled == true)
                  .toList();
              List<Course> notEnrolledCourses = state.allCourses
                  .where((element) => element.isEnrolled == false)
                  .toList();
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        enrolledCourses.isEmpty
                            ? const SizedBox()
                            : const Text(
                                'Progress :',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xff094546),
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.start,
                              ),
                        const SizedBox(height: 12),
                        for (var course in enrolledCourses)
                          CardContinueCourse(
                            onTap: () {
                              BlocProvider.of<TopicsBloc>(context)
                                  .add(FetchTopicsEvent(courseId: course.id));
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MultiBlocProvider(
                                      providers: [
                                        BlocProvider.value(
                                            value: BlocProvider.of<CoursesBloc>(
                                                context)),
                                        BlocProvider.value(
                                          value: BlocProvider.of<TopicsBloc>(
                                              context),
                                        )
                                      ],
                                      child: const PracticeScreen(),
                                    ),
                                  ));
                            },
                            quizzes:
                                "${course.progress.toString()}/${course.quizzes.toString()} Quizzes",
                            courseTitle: course.name,
                            progress: course.progress / course.quizzes,
                            buttonText: "Continue",
                            courseImage: course.imageUrl,
                          ),
                        const SizedBox(height: 24),
                        notEnrolledCourses.isNotEmpty
                            ? const Text(
                                'Recommended :',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xff094546),
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.start,
                              )
                            : const SizedBox(),
                        const SizedBox(height: 12),
                        for (var course in notEnrolledCourses)
                          CourseCard(
                            quizzes: "${course.quizzes.toString()} Quizzes",
                            courseTitle: course.name,
                            subtitle: course.description,
                            image: course.imageUrl,
                            rating: course.rating,
                            buttonText: "start",
                            onTap: () {
                              BlocProvider.of<CoursesBloc>(context)
                                  .add(EnrollToCourseEvent(course.id));

                              BlocProvider.of<TopicsBloc>(context)
                                  .add(FetchTopicsEvent(courseId: course.id));
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MultiBlocProvider(
                                      providers: [
                                        BlocProvider.value(
                                            value: BlocProvider.of<CoursesBloc>(
                                                context)),
                                        BlocProvider.value(
                                          value: BlocProvider.of<TopicsBloc>(
                                              context),
                                        )
                                      ],
                                      child: const PracticeScreen(),
                                    ),
                                  ));
                            },
                          )
                      ],
                    ),
                  ),
                ),
              );
          }
        },
      ),
    );
  }
}
