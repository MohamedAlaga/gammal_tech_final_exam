import 'package:flutter/material.dart';
import 'package:gammal_tech_final_exam/presentation/components/custom_text_field.dart';
import 'package:gammal_tech_final_exam/presentation/screens/forget_password_screen.dart';
import 'package:gammal_tech_final_exam/presentation/screens/home_screen.dart';
import 'package:gammal_tech_final_exam/presentation/screens/signup_screen.dart';

import '../components/custom_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  'assets/login_photo.png',
                  width: 256,
                  height: 270,
                ),
                const SizedBox(height: 24),
                const Text(
                  "Login",
                  style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 18),
                const CustomTextField(hint: "email..."),
                const CustomTextField(hint: "password...", isPassword: true),
                const SizedBox(height: 18),
                CustomButton(
                  text: "Login",
                  textColor: Colors.white,
                  buttonColor: const Color(0xff094546),
                  borderColor: const Color(0xff094546),
                  borderRadius: 8,
                  fontSize: 20,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 24),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Navigate to ForgetPasswordScreen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ForgetPasswordScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'Forget Password?',
                        style: TextStyle(color: Color(0xff094546)),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account?"),
                        const SizedBox(width: 4),
                        GestureDetector(
                          onTap: () {
                            // Navigate to SignUpScreen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignUpScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            'Sign up',
                            style: TextStyle(color: Color(0xff094546)),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
