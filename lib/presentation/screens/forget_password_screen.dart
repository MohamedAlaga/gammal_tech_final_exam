import 'package:flutter/material.dart';
import 'package:gammal_tech_final_exam/presentation/components/custom_button.dart';
import 'package:gammal_tech_final_exam/presentation/components/custom_text_field.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

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
                  'assets/forget_password_photo.png',
                  width: 256,
                  height: 270,
                ),
                const SizedBox(height: 24),
                const Text(
                  "Reset password",
                  style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 24),
                const CustomTextField(hint: "email..."),
                const SizedBox(height: 24),
                CustomButton(
                  text: "Login",
                  textColor: Colors.white,
                  buttonColor: const Color(0xff094546),
                  borderColor: const Color(0xff094546),
                  height: 44,
                  width: 312,
                  borderRadius: 8,
                  onTap: () {},
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
