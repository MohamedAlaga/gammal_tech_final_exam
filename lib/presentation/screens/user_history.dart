import 'package:flutter/material.dart';
import 'package:gammal_tech_final_exam/presentation/components/sub_app_bar.dart';
import 'package:gammal_tech_final_exam/presentation/components/user_history_card.dart';

import '../components/filter_dialog.dart';

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

class UserHistory extends StatelessWidget {
  const UserHistory({super.key});

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
                filters: const ['Passed exams', 'Next exam', 'Unavailable exams'],
                initialSelection:const [true, true, false],
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
      appBar: SubAppBar(
        rightIcon: Icons.filter_alt,
        onRightIconPressed: () {
          showFilterDialog(context, (selectedFilters) {
            // Handle the selected filters here
          });
        },
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
    );
  }
}
