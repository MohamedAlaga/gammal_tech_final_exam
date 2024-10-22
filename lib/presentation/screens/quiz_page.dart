import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_highlight/themes/vs2015.dart';
import 'package:gammal_tech_final_exam/core/utils/enums.dart';
import 'package:gammal_tech_final_exam/data/models/answer_model.dart';
import 'package:gammal_tech_final_exam/presentation/components/accept_custom_dialoge.dart';
import 'package:gammal_tech_final_exam/presentation/components/code_snippet_card.dart';
import 'package:gammal_tech_final_exam/presentation/components/custom_dialog.dart';
import 'package:gammal_tech_final_exam/presentation/components/quiz_question_card.dart';
import 'package:gammal_tech_final_exam/presentation/controller/courses_bloc.dart';
import 'package:gammal_tech_final_exam/presentation/controller/courses_events.dart';
import 'package:gammal_tech_final_exam/presentation/controller/exams_bloc.dart';
import 'package:gammal_tech_final_exam/presentation/controller/exams_event.dart';
import 'package:gammal_tech_final_exam/presentation/controller/exams_state.dart';
import 'package:gammal_tech_final_exam/presentation/controller/topics_bloc.dart';
import 'package:gammal_tech_final_exam/presentation/controller/topics_events.dart';
import 'package:gammal_tech_final_exam/presentation/controller/user_bloc.dart';
import 'package:gammal_tech_final_exam/presentation/controller/user_events.dart';
import 'package:gammal_tech_final_exam/presentation/screens/result_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizPage extends StatelessWidget {
  QuizPage({super.key});
  final CountDownController countDownController = CountDownController();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _showWelcomeDialog(context);
    });
    return WillPopScope(
      onWillPop: () async {
        showGeneralDialog(
          context: context,
          transitionDuration: const Duration(milliseconds: 300),
          barrierDismissible: true,
          barrierLabel: '',
          transitionBuilder: (context, a1, a2, widget) {
            final curvedValue = Curves.easeInOutBack.transform(a1.value) - 1.0;
            return Transform(
              transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
              child: Opacity(
                opacity: a1.value,
                child: CustomDialog(
                  title: 'Exit Exam',
                  content:
                      'Are you sure you want to exit the exam?\nOne attempt will be deducted.',
                  onTap: () {
                    BlocProvider.of<ExamsBloc>(context).add(SubmitAnswersEvent());
                    BlocProvider.of<ExamsBloc>(context).add(ExitQuizEvent());
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                ),
              ),
            );
          },
          pageBuilder: (context, animation1, animation2) {
            return const SizedBox();
          },
        );
        return false;
      },
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<ExamsBloc, ExamsState>(
            builder: (context, state) {
              switch (state.questionsRequestState) {
                case RequestState.loading:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case RequestState.error:
                  return const Center(
                    child: Text('Error loading exams'),
                  );
                case RequestState.loaded:
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Question ${state.currentQuestionIndex + 1}',
                                style: GoogleFonts.quicksand(
                                    fontSize: 24,
                                    color: const Color(0xFF004643),
                                    fontWeight: FontWeight.w700),
                              ),
                              CircularCountDownTimer(
                                controller: countDownController,
                                initialDuration: 0,
                                strokeCap: StrokeCap.round,
                                autoStart: false,
                                width: 72,
                                height: 72,
                                duration: state.duration,
                                fillColor: const Color(0xFFFF904D),
                                ringColor: const Color(0xFFE0E0E0),
                                strokeWidth: 8,
                                textStyle: GoogleFonts.quicksand(
                                    color: const Color(0xFF094546),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                                textFormat: CountdownTextFormat.MM_SS,
                                isReverse: true,
                                onComplete: state.currentQuestionIndex !=
                                        state.questions.length - 1
                                    ? () {
                                        BlocProvider.of<ExamsBloc>(context)
                                            .add(NextQuestionEvent(
                                                int.parse(
                                                  state
                                                      .questions[state
                                                          .currentQuestionIndex]
                                                      .id,
                                                ),
                                                null));
                                        countDownController.restart();
                                      }
                                    : () {
                                        BlocProvider.of<ExamsBloc>(context)
                                            .add(NextQuestionEvent(
                                                int.parse(
                                                  state
                                                      .questions[state
                                                          .currentQuestionIndex]
                                                      .id,
                                                ),
                                                null));
                                        BlocProvider.of<ExamsBloc>(context)
                                            .add(SubmitAnswersEvent());
                                        BlocProvider.of<ExamsBloc>(context)
                                            .add(ExitQuizEvent());
                                        BlocProvider.of<CoursesBloc>(context)
                                            .add(FetchAllCoursesEvent());
                                        BlocProvider.of<TopicsBloc>(context)
                                            .add(FetchSuggestedTopicsEvent());
                                        BlocProvider.of<UserBloc>(context)
                                            .add(GetWelcomeUserData());
                                        BlocProvider.of<CoursesBloc>(context)
                                            .add(FetchSuggestedCoursesEvent());
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  MultiBlocProvider(
                                                providers: [
                                                  BlocProvider.value(
                                                      value: BlocProvider.of<
                                                          TopicsBloc>(context)),
                                                  BlocProvider.value(
                                                      value: BlocProvider.of<
                                                          ExamsBloc>(context))
                                                ],
                                                child: const ResultScreen(),
                                              ),
                                            ));
                                      },
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 24.0),
                            child: CodeSnippetCard(
                              codeSnippet: state.isStarted
                                  ? state.questions[state.currentQuestionIndex]
                                      .question
                                  : " ",
                              language: 'c',
                              theme: vs2015Theme,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 12.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                state.questions[state.currentQuestionIndex]
                                    .questionText,
                                style: GoogleFonts.sourceSans3(
                                    color: const Color(0xFF004B4C),
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          for (AnswerModel answer in state
                              .questions[state.currentQuestionIndex].answers)
                            Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: InkWell(
                                onTap: state.currentQuestionIndex !=
                                        state.questions.length - 1
                                    ? () {
                                        BlocProvider.of<ExamsBloc>(context)
                                            .add(NextQuestionEvent(
                                                int.parse(answer.id),
                                                int.parse(
                                                  state
                                                      .questions[state
                                                          .currentQuestionIndex]
                                                      .id,
                                                )));
                                        countDownController.restart();
                                      }
                                    : () {
                                        BlocProvider.of<ExamsBloc>(context)
                                            .add(NextQuestionEvent(
                                                int.parse(answer.id),
                                                int.parse(
                                                  state
                                                      .questions[state
                                                          .currentQuestionIndex]
                                                      .id,
                                                )));
                                        countDownController.restart();
                                        BlocProvider.of<ExamsBloc>(context)
                                            .add(SubmitAnswersEvent());
                                        BlocProvider.of<ExamsBloc>(context)
                                            .add(ExitQuizEvent());
                                        BlocProvider.of<CoursesBloc>(context)
                                            .add(FetchAllCoursesEvent());
                                        BlocProvider.of<TopicsBloc>(context)
                                            .add(FetchSuggestedTopicsEvent());
                                        BlocProvider.of<UserBloc>(context)
                                            .add(GetWelcomeUserData());
                                        BlocProvider.of<CoursesBloc>(context)
                                            .add(FetchSuggestedCoursesEvent());
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  MultiBlocProvider(
                                                providers: [
                                                  BlocProvider.value(
                                                      value: BlocProvider.of<
                                                          TopicsBloc>(context))
                                                ],
                                                child: const ResultScreen(),
                                              ),
                                            ));
                                      },
                                child: QuizAnswerCard(
                                  content: answer.answer,
                                ),
                              ),
                            )
                        ],
                      ),
                    ),
                  );
              }
            },
          ),
        ),
      ),
    );
  }

  Future<bool> _showWelcomeDialog(
    BuildContext context,
  ) async {
    await showGeneralDialog(
      context: context,
      transitionDuration: const Duration(milliseconds: 300),
      barrierDismissible: true,
      barrierLabel: '',
      transitionBuilder: (context, a1, a2, widget) {
        final curvedValue = Curves.easeInOutBack.transform(a1.value) - 1.0;
        return Transform(
          transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
          child: Opacity(
            opacity: a1.value,
            child:
                BlocBuilder<ExamsBloc, ExamsState>(builder: (context, state) {
              return AcceptCustomDialoge(
                onTap: () {
                  BlocProvider.of<ExamsBloc>(context).add(StartQuizEvent());
                  countDownController.start();
                  Navigator.pop(context);
                },
                body:
                    "the exam contains ${BlocProvider.of<ExamsBloc>(context).state.questions.length} questions \n you have ${BlocProvider.of<ExamsBloc>(context).state.duration} seconds to answer each question",
                textAlign: TextAlign.center,
              );
            }),
          ),
        );
      },
      pageBuilder: (context, animation1, animation2) {
        return const SizedBox();
      },
    ).then((value) {
      if (!BlocProvider.of<ExamsBloc>(context).state.isStarted) {
        Navigator.pop(context);
      }
    });
    return true;
  }
}
