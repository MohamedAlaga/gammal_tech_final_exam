import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gammal_tech_final_exam/core/utils/enums.dart';
import 'package:gammal_tech_final_exam/presentation/components/user_history_card.dart';
import 'package:gammal_tech_final_exam/presentation/controller/log_bloc.dart';
import 'package:gammal_tech_final_exam/presentation/controller/log_state.dart';
import 'package:gammal_tech_final_exam/presentation/screens/notification_screen.dart';

import '../components/filter_dialog.dart';
import '../components/main_app_bar.dart';
import '../components/nav_bar.dart';
import '../controller/user_bloc.dart';
import '../controller/user_state.dart';

class UserHistoryScreen extends StatelessWidget {
  const UserHistoryScreen({super.key});

  void showFilterDialog(BuildContext context, Function(List<bool>) onApply) {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FilterDialog(
                title: 'Choose filters',
                filters: const [
                  'Passed exams',
                  'Next exam',
                  'Unavailable exams'
                ],
                initialSelection: const [true, true, false],
                onApply: onApply,
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
                  builder: (context) => const NotificationScreen(),
                ),
              );
            },
            image: state.welcomeData.imageUrl,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: BlocBuilder<LogBloc, LogState>(
        builder: (context, state) {
          switch (state.requestState) {
            case RequestState.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case RequestState.error:
              return Center(
                child: Text(state.errorMessage),
              );
            case RequestState.loaded:
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Center(
                    child: Column(
                      children: [
                        for (var log in state.userLogs)
                          UserHistoryCard(
                            dateTime: log.dateTime,
                            title: log.description[0],
                            info: log.description.sublist(1),
                            image: log.imageUrl,
                          )
                      ],
                    ),
                  ),
                ),
              );
          }
        },
      ),
      bottomNavigationBar: NavBar(currentIndex: 3),
    );
  }
}
