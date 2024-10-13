import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gammal_tech_final_exam/core/utils/enums.dart';
import 'package:gammal_tech_final_exam/presentation/components/custom_button.dart';
import 'package:gammal_tech_final_exam/presentation/controller/courses_bloc.dart';
import 'package:gammal_tech_final_exam/presentation/controller/courses_events.dart';
import 'package:gammal_tech_final_exam/presentation/controller/exams_bloc.dart';
import 'package:gammal_tech_final_exam/presentation/controller/exams_state.dart';
import 'package:gammal_tech_final_exam/presentation/controller/topics_bloc.dart';
import 'package:gammal_tech_final_exam/presentation/controller/topics_events.dart';
import 'package:gammal_tech_final_exam/presentation/controller/user_bloc.dart';
import 'package:gammal_tech_final_exam/presentation/controller/user_events.dart';
import 'package:gammal_tech_final_exam/presentation/screens/main_screen.dart';

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
                        CustomButton(
                          text: 'Continue',
                          textColor: Colors.white,
                          buttonColor: const Color(0xff094546),
                          borderColor: const Color(0xff094546),
                          borderRadius: 8,
                          fontSize: 20,
                          onTap: () {
                            BlocProvider.of<CoursesBloc>(context)
                                .add(FetchAllCoursesEvent());
                            BlocProvider.of<TopicsBloc>(context)
                                .add(FetchSuggestedTopicsEvent());
                            BlocProvider.of<UserBloc>(context)
                                .add(GetWelcomeUserData());
                            BlocProvider.of<CoursesBloc>(context)
                                .add(FetchSuggestedCoursesEvent());
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                              builder: (context) {
                                return MultiBlocProvider(
                                  providers: [
                                    BlocProvider.value(
                                        value: BlocProvider.of<CoursesBloc>(
                                            context)),
                                    BlocProvider.value(
                                        value: BlocProvider.of<TopicsBloc>(
                                            context)),
                                    BlocProvider.value(
                                        value: BlocProvider.of<UserBloc>(
                                            context)),
                                  ],
                                  child: const MainScreen(),
                                );
                              },
                            ), (route) => false);
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
