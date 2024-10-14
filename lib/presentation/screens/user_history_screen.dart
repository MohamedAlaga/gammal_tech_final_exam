import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gammal_tech_final_exam/presentation/components/user_history_card.dart';

import '../components/filter_dialog.dart';
import '../components/main_app_bar.dart';
import '../components/nav_bar.dart';
import '../controller/user_bloc.dart';
import '../controller/user_state.dart';

List<List<dynamic>> history = [
  [
    '12:30 30/9/2024',
    'printf("Gammal tech");',
    ['Result: 5/6', 'Average time : 20 sec'],
    ''
  ],
  [
    '12:30 30/9/2024',
    'printf("Gammal tech");',
    ['Result: 5/6', 'Average time : 20 sec'],
    ''
  ],
  [
    '12:30 30/9/2024',
    'printf("Gammal tech");',
    ['Result: 5/6', 'Average time : 20 sec'],
    ''
  ],
  [
    '12:30 30/9/2024',
    'printf("Gammal tech");',
    ['Result: 5/6', 'Average time : 20 sec'],
    ''
  ],
  [
    '12:30 30/9/2024',
    'printf("Gammal tech");',
    ['Result: 5/6', 'Average time : 20 sec'],
    ''
  ],
  [
    '12:30 30/9/2024',
    'printf("Gammal tech");',
    ['Result: 5/6', 'Average time : 20 sec'],
    ''
  ]
];

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
          padding: const EdgeInsets.all(24),
          child: Center(
            child: Column(
              children: [
                for (int i = 0; i < history.length; i++)
                  UserHistoryCard(
                    dateTime: history[i][0],
                    title: history[i][1],
                    info: history[i][2],
                    image: history[i][3],
                  )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: NavBar(currentIndex: 3),
    );
  }
}
