import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gammal_tech_final_exam/presentation/components/custom_text_field.dart';
import 'package:gammal_tech_final_exam/presentation/components/custom_toast.dart';
import 'package:gammal_tech_final_exam/presentation/controller/signup_bloc.dart';
import 'package:gammal_tech_final_exam/presentation/controller/signup_events.dart';
import 'package:gammal_tech_final_exam/presentation/screens/login_screen.dart';

import '../components/custom_button.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController userName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  'assets/signup_photo.png',
                  width: 256,
                  height: 270,
                ),
                const SizedBox(height: 24),
                const Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 18),
                CustomTextField(hint: "userName...", controller: userName),
                CustomTextField(hint: "email...", controller: emailController),
                CustomTextField(
                  hint: "password...",
                  isPassword: true,
                  controller: passwordController,
                ),
                CustomTextField(
                  hint: "confirm password...",
                  isPassword: true,
                  controller: confirmPasswordController,
                ),
                const SizedBox(height: 18),
                CustomButton(
                  text: "SignUp",
                  textColor: Colors.white,
                  buttonColor: const Color(0xff094546),
                  borderColor: const Color(0xff094546),
                  fontSize: 20,
                  borderRadius: 8,
                  onTap: () {
                    if (passwordController.text ==
                        confirmPasswordController.text) {
                      BlocProvider.of<SignupBloc>(context).add(StartSignupEvent(
                          emailController.text,
                          passwordController.text,
                          userName.text,
                          context));
                    } else {
                      showRedToast("passwords do not match");
                    }
                  },
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?"),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Color(0xff094546)),
                      ),
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
