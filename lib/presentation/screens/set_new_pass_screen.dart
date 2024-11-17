import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gammal_tech_final_exam/presentation/components/custom_button.dart';
import 'package:gammal_tech_final_exam/presentation/components/custom_text_field.dart';
import 'package:gammal_tech_final_exam/presentation/controller/reset_pass_bloc.dart';
import 'package:gammal_tech_final_exam/presentation/controller/reset_pass_event.dart';

class SetNewPassScreen extends StatelessWidget {
  SetNewPassScreen({super.key});
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
                    'assets/setPassword.png',
                    width: 256,
                    height: 270,
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    "Enter new password",
                    style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                  const Text(
                    "Don't share your password with anyone",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 24),
                  CustomTextField(
                    hint: "*********",
                    controller: controller,
                    isPassword: true,
                  ),
                  const SizedBox(height: 24),
                  CustomButton(
                    text: "Verify",
                    textColor: Colors.white,
                    buttonColor: const Color(0xff094546),
                    borderColor: const Color(0xff094546),
                    borderRadius: 8,
                    fontSize: 20,
                    onTap: () {
                      BlocProvider.of<ResetPassBloc>(context)
                          .add(FinishResetPassword(controller.text, context));
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
