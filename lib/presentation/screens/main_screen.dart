import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gammal_tech_final_exam/core/utils/enums.dart';
import 'package:gammal_tech_final_exam/presentation/controller/user_bloc.dart';
import 'package:gammal_tech_final_exam/presentation/controller/user_events.dart';
import 'package:gammal_tech_final_exam/presentation/controller/user_state.dart';
import 'package:gammal_tech_final_exam/presentation/screens/home_screen.dart';
import 'package:gammal_tech_final_exam/presentation/screens/login_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      if (state.loginRequestState == RequestState.loaded) {
        BlocProvider.of<UserBloc>(context).add(GetWelcomeUserData());
        return const HomeScreen();
      } else if (state.loginRequestState == RequestState.error) {
        return LoginScreen();
      } else {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
    });
  }
}
