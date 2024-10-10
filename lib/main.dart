import 'package:flutter/material.dart';
import 'package:gammal_tech_final_exam/presentation/screens/user_profile_screen.dart';
// import 'package:gammal_tech_final_exam/presentation/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserProfileScreen(),
    );
  }
}
