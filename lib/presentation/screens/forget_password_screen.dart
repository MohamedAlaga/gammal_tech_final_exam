import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gammal_tech_final_exam/presentation/components/custom_button.dart';
import 'package:gammal_tech_final_exam/presentation/components/custom_text_field.dart';
import 'package:gammal_tech_final_exam/presentation/controller/reset_pass_bloc.dart';
import 'package:gammal_tech_final_exam/presentation/controller/reset_pass_event.dart';
import 'package:gammal_tech_final_exam/presentation/screens/login_screen.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});
  final TextEditingController controller = TextEditingController();
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
                CustomTextField(hint: "email...", controller: controller),
                const SizedBox(height: 24),
                CustomButton(
                  text: "Send OTP",
                  textColor: Colors.white,
                  buttonColor: const Color(0xff094546),
                  borderColor: const Color(0xff094546),
                  borderRadius: 8,
                  fontSize: 20,
                  onTap: () {
                    BlocProvider.of<ResetPassBloc>(context).add(
                      StartResetPassEvent(controller.text, context),
                    );
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
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                          (route) => false,
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
