import 'package:flutter/material.dart';
import 'package:gammal_tech_final_exam/presentation/components/custom_text_field.dart';
import 'package:gammal_tech_final_exam/presentation/components/sub_app_bar.dart';
import 'package:gammal_tech_final_exam/presentation/screens/user_profile_screen.dart';

import '../components/custom_button.dart';

List<dynamic> user = [
  'assets/user_photo.png',
  'Mohamed Al-Azab',
  'Alexandria University',
  'I’m Software Engineer focused on Mobile Development',
];

List<dynamic> info = [
  ['email', 'mohamed@gmail.com'],
  ['phone number', '01234567891'],
];

class EditUserProfileScreen extends StatelessWidget {
  EditUserProfileScreen({super.key});
  final TextEditingController skills = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SubAppBar(
        rightIcon: Icons.notifications_none,
        onRightIconPressed: () {},
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: Column(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage(user[0]),
                      backgroundColor: Colors.grey,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.white,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border:
                                Border.all(color: const Color(0xff094546), width: 1),
                          ),
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            icon: const Icon(Icons.edit,
                                color: Color(0xff094546), size: 16),
                            onPressed: () {
                              // Handle edit action
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        user[1],
                        style:
                            const TextStyle(fontSize: 18, color: Colors.black),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.edit,
                        size: 16,
                        color: Color(0xff094546),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        user[2],
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black.withOpacity(0.7),
                        ),
                        overflow:
                            TextOverflow.ellipsis, // Handles text overflow
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.edit,
                        size: 16,
                        color: Color(0xff094546),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        user[3],
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black.withOpacity(0.7),
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.edit,
                        size: 16,
                        color: Color(0xff094546),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 18),
                for (int i = 0; i < info.length; i++)
                  CustomTextField(hint: info[i][0], controller: skills),
                const SizedBox(height: 18),
                CustomButton(
                  text: 'Confirm',
                  textColor: Colors.white,
                  buttonColor: const Color(0xff094546),
                  borderColor: const Color(0xff094546),
                  width: MediaQuery.of(context).size.width,
                  borderRadius: 8,
                  fontSize: 20,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UserProfileScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
