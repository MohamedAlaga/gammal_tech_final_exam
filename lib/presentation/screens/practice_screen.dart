import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gammal_tech_final_exam/core/utils/enums.dart';
import 'package:gammal_tech_final_exam/domain/entities/topic.dart';
import 'package:gammal_tech_final_exam/presentation/components/card_can_not_start_exam.dart';
import 'package:gammal_tech_final_exam/presentation/components/card_exam.dart';
import 'package:gammal_tech_final_exam/presentation/components/card_finish_exam_course.dart';
import 'package:gammal_tech_final_exam/presentation/components/sub_app_bar.dart';
import 'package:gammal_tech_final_exam/presentation/controller/courses_bloc.dart';
import 'package:gammal_tech_final_exam/presentation/controller/exams_bloc.dart';
import 'package:gammal_tech_final_exam/presentation/controller/exams_event.dart';
import 'package:gammal_tech_final_exam/presentation/controller/topics_bloc.dart';
import 'package:gammal_tech_final_exam/presentation/controller/topics_state.dart';
import 'package:gammal_tech_final_exam/presentation/screens/more_data_screen.dart';
import 'package:gammal_tech_final_exam/presentation/screens/quiz_page.dart';

class PracticeScreen extends StatelessWidget {
  const PracticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SubAppBar(
        rightIcon: Icons.notifications_none,
        appBarColor: Colors.white,
        iconsColor: Color(0xff094546),
        onRightIconPressed: () {},
      ),
      backgroundColor: Colors.white,
      body: BlocBuilder<TopicsBloc, TopicsState>(
        builder: (context, state) {
          switch (state.topicsRequestState) {
            case RequestState.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case RequestState.error:
              return const Center(
                child: Text('Error'),
              );
            case RequestState.loaded:
              List<Topic> finishedTopics = state.topics
                  .where((element) => element.isCompleted == true)
                  .toList();
              List<Topic> notFinishedTopics = state.topics.where((element) {
                return element.isCompleted == false;
              }).toList();
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Center(
                    child: Column(
                      children: [
                        for (Topic topic in finishedTopics)
                          CardFinishExamCourse(
                            quizzes: '${topic.quizCount.toString()} Questions',
                            courseTitle: topic.title,
                          ),
                        CardExam(
                          questions:
                              "${notFinishedTopics[0].quizCount.toString()} Questions",
                          courseTitle: notFinishedTopics[0].title,
                          subtitle: notFinishedTopics[0].subtitle,
                          time:
                              "${notFinishedTopics[0].duration.toString()} sec",
                          courseImage: notFinishedTopics[0].imageUrl,
                          onMorePressed: () {
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
                                              context))
                                    ],
                                    child: MoreDataScreen(
                                      description:
                                          notFinishedTopics[0].description,
                                      imageUrl: notFinishedTopics[0].imageUrl,
                                      neededSkills: notFinishedTopics[0].skills,
                                      points: notFinishedTopics[0]
                                          .points
                                          .toString(),
                                      quizId: notFinishedTopics[0].id,
                                      duration: notFinishedTopics[0].duration,
                                    ),
                                  ),
                                ));
                          },
                          onStartPressed: () {
                            BlocProvider.of<ExamsBloc>(context).add(
                                FetchQuestionsEvent(notFinishedTopics[0].id,
                                    notFinishedTopics[0].duration));
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    MultiBlocProvider(providers: [
                                  BlocProvider.value(
                                      value:
                                          BlocProvider.of<ExamsBloc>(context)),
                                  BlocProvider.value(
                                    value: BlocProvider.of<TopicsBloc>(context),
                                  )
                                ], child: QuizPage()),
                              ),
                            );
                          },
                        ),
                        for (int i = 1; i < notFinishedTopics.length; i++)
                          CardCanNotStartExam(
                            quizzes:
                                "${notFinishedTopics[i].quizCount.toString()} Questions",
                            courseTitle: notFinishedTopics[i].title,
                            courseImage: notFinishedTopics[i].imageUrl,
                          ),
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
