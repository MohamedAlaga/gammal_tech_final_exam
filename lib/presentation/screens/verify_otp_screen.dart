import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gammal_tech_final_exam/presentation/components/custom_button.dart';
import 'package:gammal_tech_final_exam/presentation/components/custom_text_field.dart';
import 'package:gammal_tech_final_exam/presentation/controller/reset_pass_bloc.dart';
import 'package:gammal_tech_final_exam/presentation/controller/reset_pass_event.dart';
import 'package:gammal_tech_final_exam/presentation/controller/signup_bloc.dart';
import 'package:gammal_tech_final_exam/presentation/controller/signup_events.dart';

class VerifyOtpScreen extends StatelessWidget {
  VerifyOtpScreen({super.key});
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    'assets/otp.png',
                    width: 256,
                    height: 270,
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    "Enter OTP",
                    style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                  const Text(
                    "6-digit OTP has been sent to your email",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 24),
                  CustomTextField(hint: "6-Digits OTP", controller: controller),
                  const SizedBox(height: 24),
                  CustomButton(
                    text: "Verify",
                    textColor: Colors.white,
                    buttonColor: const Color(0xff094546),
                    borderColor: const Color(0xff094546),
                    borderRadius: 8,
                    fontSize: 20,
                    onTap: () {
                      if(BlocProvider.of<SignupBloc>(context).state.email.isEmpty){
                      BlocProvider.of<ResetPassBloc>(context).add(
                        VerifyOtpEvent(controller.text, context),
                      );}else{
                        BlocProvider.of<SignupBloc>(context).add(
                          VerifySignupEvent(controller.text, context),
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
