import 'package:flutter/material.dart';
import 'package:gammal_tech_final_exam/presentation/components/card_info_home_page.dart';
import 'package:gammal_tech_final_exam/presentation/components/custom_button.dart';
import 'package:gammal_tech_final_exam/presentation/components/main_app_bar.dart';
import 'package:gammal_tech_final_exam/presentation/screens/course_screen.dart';
import 'package:gammal_tech_final_exam/presentation/screens/user_history.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        rightIcon: Icons.notifications_none,
        onNotificationPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UserHistory(),
            ),
          );
        },
        image: 'https://avatars.githubusercontent.com/u/109886112?s=48&v=4',
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Center(
            child: Column(
              children: [
                CardInfoHomePage(
                  name: 'Mohamed',
                  solvedExams: 100,
                  rank: 1,
                  outOf: 2000,
                  points: 5000,
                ),
                SizedBox(height: 24),
                CustomButton(
                  text: 'Practice',
                  textColor: Colors.white,
                  buttonColor: Color(0xff094546),
                  borderColor: Color(0xff094546),
                  borderRadius: 8,
                  fontSize: 20,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CourseScreen(),
                      ),
                    );
                  },
                ),
                SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
