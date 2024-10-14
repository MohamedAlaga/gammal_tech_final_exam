import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gammal_tech_final_exam/core/services/service_locator.dart';
import 'package:gammal_tech_final_exam/presentation/controller/courses_bloc.dart';
import 'package:gammal_tech_final_exam/presentation/controller/exams_bloc.dart';
import 'package:gammal_tech_final_exam/presentation/controller/topics_bloc.dart';
import 'package:gammal_tech_final_exam/presentation/controller/user_bloc.dart';
import 'package:gammal_tech_final_exam/presentation/controller/user_events.dart';
import 'package:gammal_tech_final_exam/presentation/screens/main_screen.dart';
import 'package:toastification/toastification.dart';

void main() {
  ServiceLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: MultiBlocProvider(
        providers: [
          BlocProvider<UserBloc>(
              create: (context) => sl<UserBloc>()..add(ValidateUserEvent())),
          BlocProvider<CoursesBloc>(create: (context) => sl<CoursesBloc>()),
          BlocProvider<TopicsBloc>(create: (context) => sl<TopicsBloc>()),
          BlocProvider<ExamsBloc>(create: (context) => sl<ExamsBloc>()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              progressIndicatorTheme:
                  const ProgressIndicatorThemeData(color: Color(0xff094546))),
          home: const MainScreen(),
        ),
      ),
    );
  }
}
