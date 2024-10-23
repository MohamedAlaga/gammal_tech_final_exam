import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gammal_tech_final_exam/core/services/service_locator.dart';
import 'package:gammal_tech_final_exam/core/utils/enums.dart';
import 'package:gammal_tech_final_exam/domain/usecase/check_user_attempts_usecase.dart';
import 'package:gammal_tech_final_exam/presentation/components/accept_custom_dialoge.dart';
import 'package:gammal_tech_final_exam/presentation/components/custom_button.dart';
import 'package:gammal_tech_final_exam/presentation/components/custom_toast.dart';
import 'package:gammal_tech_final_exam/presentation/controller/courses_bloc.dart';
import 'package:gammal_tech_final_exam/presentation/controller/courses_events.dart';
import 'package:gammal_tech_final_exam/presentation/controller/exams_bloc.dart';
import 'package:gammal_tech_final_exam/presentation/controller/exams_event.dart';
import 'package:gammal_tech_final_exam/presentation/controller/exams_state.dart';
import 'package:gammal_tech_final_exam/presentation/controller/topics_bloc.dart';
import 'package:gammal_tech_final_exam/presentation/controller/topics_events.dart';
import 'package:gammal_tech_final_exam/presentation/controller/user_bloc.dart';
import 'package:gammal_tech_final_exam/presentation/controller/user_events.dart';
import 'package:gammal_tech_final_exam/presentation/screens/quiz_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExamsBloc, ExamsState>(
      builder: (context, state) {
        switch (state.saveAnswerRequestState) {
          case RequestState.error:
            return const Scaffold(
              body: Center(
                child: Text('Error'),
              ),
            );
          case RequestState.loading:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case RequestState.loaded:
            return Scaffold(
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: MediaQuery.of(context).size.height / 5),
                  child: Center(
                    child: Column(
                      children: [
                        state.result!.round() / 100 == 1
                            ? Image.asset('assets/success_photo.png')
                            : Image.asset('assets/field_photo.png'),
                        const SizedBox(height: 24),
                        Text(
                          '${state.result!.round()}%',
                          style: const TextStyle(
                              fontSize: 64,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff094546)),
                        ),
                        const SizedBox(height: 24),
                        state.result!.round() / 100 == 1
                            ? const Text(
                                'Congratulation !!',
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff094546)),
                              )
                            : const Text(
                                'You can make better next time',
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff094546)),
                              ),
                        const SizedBox(height: 24),
                        if ((state.result!.round() / 100 == 1) &&
                            BlocProvider.of<TopicsBloc>(context)
                                .state
                                .topics
                                .isNotEmpty &&
                            (state.quizId !=
                                BlocProvider.of<TopicsBloc>(context)
                                    .state
                                    .topics
                                    .last
                                    .id))
                          CustomButton(
                            icon: const Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                            text: "Next Exam",
                            textColor: Colors.white,
                            buttonColor: const Color(0xff094546),
                            borderColor: const Color(0xff094546),
                            borderRadius: 8,
                            fontSize: 20,
                            onTap: () async {
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
                              var result = await sl<CheckUserAttemptsUsecase>()
                                  .execute();
                              Navigator.of(context, rootNavigator: true).pop();
                              result.fold(
                                (failure) {
                                  showRedToast(
                                      "Error occured while checking attempts remaning");
                                },
                                (hasAttemptsLeft) {
                                  if (hasAttemptsLeft) {
                                    int nextexamIndex =
                                        BlocProvider.of<TopicsBloc>(context)
                                                .state
                                                .topics
                                                .indexWhere((element) =>
                                                    element.id ==
                                                    state.quizId) +
                                            1;
                                    String nextExamId =
                                        BlocProvider.of<TopicsBloc>(context)
                                            .state
                                            .topics[nextexamIndex]
                                            .id;
                                    BlocProvider.of<ExamsBloc>(context)
                                        .add(ExitQuizEvent());
                                    BlocProvider.of<TopicsBloc>(context)
                                        .add(SetNextTopicEvent());
                                    BlocProvider.of<ExamsBloc>(context).add(
                                        FetchQuestionsEvent(
                                            nextExamId,
                                            BlocProvider.of<ExamsBloc>(context)
                                                .state
                                                .duration));

                                    if (BlocProvider.of<TopicsBloc>(context)
                                        .state
                                        .topics
                                        .isNotEmpty) {
                                      BlocProvider.of<TopicsBloc>(context).add(
                                          (FetchTopicsEvent(
                                              courseId:
                                                  BlocProvider.of<TopicsBloc>(
                                                          context)
                                                      .state
                                                      .topics
                                                      .first
                                                      .courseId)));
                                    }
                                    BlocProvider.of<TopicsBloc>(context)
                                        .add((FetchSuggestedTopicsEvent()));
                                    BlocProvider.of<CoursesBloc>(context)
                                        .add(FetchAllCoursesEvent());
                                    Navigator.pop(context);
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
                                        final curvedValue = Curves.easeInOutBack
                                                .transform(a1.value) -
                                            1.0;
                                        return Transform(
                                          transform: Matrix4.translationValues(
                                              0.0, curvedValue * 200, 0.0),
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
                        if (state.result!.round() / 100 != 1)
                          CustomButton(
                              icon: const Icon(
                                Icons.refresh,
                                color: Colors.white,
                              ),
                              text: "try again",
                              textColor: Colors.white,
                              buttonColor: const Color(0xff094546),
                              borderColor: const Color(0xff094546),
                              borderRadius: 8,
                              fontSize: 20,
                              onTap: () async {
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
                                              BlocProvider.of<ExamsBloc>(
                                                      context)
                                                  .state
                                                  .quizId,
                                              BlocProvider.of<ExamsBloc>(
                                                      context)
                                                  .state
                                                  .duration));
                                      BlocProvider.of<ExamsBloc>(context)
                                          .add(StartQuizEvent());
                                      Navigator.pop(context);
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
                              }),
                        const SizedBox(height: 24),
                        CustomButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          text: 'Back',
                          textColor: Colors.white,
                          buttonColor: const Color(0xff094546),
                          borderColor: const Color(0xff094546),
                          borderRadius: 8,
                          fontSize: 20,
                          onTap: () {
                            BlocProvider.of<UserBloc>(context)
                                .add(GetWelcomeUserData());
                            if (BlocProvider.of<TopicsBloc>(context)
                                .state
                                .topics
                                .isNotEmpty) {
                              BlocProvider.of<TopicsBloc>(context).add(
                                  (FetchTopicsEvent(
                                      courseId:
                                          BlocProvider.of<TopicsBloc>(context)
                                              .state
                                              .topics
                                              .first
                                              .courseId)));
                            }
                            BlocProvider.of<TopicsBloc>(context)
                                .add((FetchSuggestedTopicsEvent()));
                            BlocProvider.of<CoursesBloc>(context)
                                .add(FetchAllCoursesEvent());
                            Navigator.pop(context);
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
        }
      },
    );
  }
}
