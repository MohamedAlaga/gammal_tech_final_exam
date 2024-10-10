import 'package:flutter/material.dart';
import 'package:gammal_tech_final_exam/presentation/components/custom_button.dart';
import 'package:gammal_tech_final_exam/presentation/screens/user_profile_screen.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.grad,
  });

  final int grad;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                grad / 100 == 1
                    ? Image.asset('assets/success_photo.png')
                    : Image.asset('assets/field_photo.png'),
                SizedBox(height: 24),
                Text(
                  '$grad%',
                  style: TextStyle(
                      fontSize: 64,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff094546)),
                ),
                SizedBox(height: 24),
                grad / 100 == 1
                    ? Text(
                        'Congratulation !!',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff094546)),
                      )
                    : Text(
                        'You can make better next time',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff094546)),
                      ),
                SizedBox(height: 24),
                CustomButton(
                  text: 'Continue',
                  textColor: Colors.white,
                  buttonColor: Color(0xff094546),
                  borderColor: Color(0xff094546),
                  height: 45,
                  width: MediaQuery.of(context).size.width,
                  borderRadius: 8,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UserProfileScreen(),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
