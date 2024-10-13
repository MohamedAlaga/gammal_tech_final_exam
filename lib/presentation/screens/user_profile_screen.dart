import 'package:flutter/material.dart';
import 'package:gammal_tech_final_exam/presentation/components/card_info.dart';
import 'package:gammal_tech_final_exam/presentation/components/custom_button.dart';
import 'package:gammal_tech_final_exam/presentation/components/progress_card.dart';
import 'package:gammal_tech_final_exam/presentation/components/skills_list.dart';
import 'package:gammal_tech_final_exam/presentation/screens/edit_user_profile_screen.dart';

import '../components/sub_app_bar.dart';

List<dynamic> info = [
  ['email', 'mohamed@gmail.com'],
  ['phone number', '01234567891'],
  ['points', 5000],
  ['points', 5000]
];
List<dynamic> user = [
  'https://media.licdn.com/dms/image/v2/D5603AQGyqO71BGTIQA/profile-displayphoto-shrink_400_400/profile-displayphoto-shrink_400_400/0/1724595865968?e=1733961600&v=beta&t=axj8aNdvToysiogWaZR7Fddi1NjwWSx82HAsviFNy2w',
  'Mohamed Al-Azab',
  'Alexandria University',
  'I’m Software Engneer focus on Mobile develobment',
];

List<String> skills = [
  'C programming',
  'C++ programming',
  'OOP',
  'Data Structures',
  'Algorithms',
  'Dart',
];

List<dynamic> progress = [
  ['C programming', 0.3],
  ['C++ programming', 0.6],
  ['OOP', 0.8],
  ['Data Structures', 0.4]
];

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

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
                CircleAvatar(
                  radius: 60,
                  backgroundImage: _getImageProvider(user[0]),
                  backgroundColor: Colors.grey[400],
                ),
                const SizedBox(height: 12),
                Text(
                  user[1],
                  style: const TextStyle(fontSize: 18, color: Colors.black),
                ),
                const SizedBox(height: 12),
                Text(
                  user[2],
                  style: TextStyle(
                      fontSize: 16, color: Colors.black.withOpacity(0.7)),
                ),
                const SizedBox(height: 12),
                Text(
                  user[3],
                  style: TextStyle(
                      fontSize: 14, color: Colors.black.withOpacity(0.7)),
                ),
                const SizedBox(height: 18),
                for (int i = 0; i < info.length; i++)
                  CardInfo(
                    borderColor: const Color(0xffE3E5E8),
                    info: info[i][0],
                    information: '${info[i][1]}',
                  ),
                const SizedBox(height: 18),
                CustomButton(
                  text: 'Edit your profile',
                  textColor: Colors.white,
                  buttonColor: const Color(0xff094546),
                  borderColor: const Color(0xff094546),
                  borderRadius: 8,
                  fontSize: 20,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditUserProfileScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 24),
                const Row(
                  children: [
                    Text(
                      'Skills:',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                SkillsList(skills: skills),
                const SizedBox(height: 24),
                const Row(
                  children: [
                    Text(
                      'Progress:',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                for (int i = 0; i < progress.length; i++)
                  ProgressCard(
                    courseTitle: progress[i][0],
                    progress: progress[i][1],
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }

  ImageProvider _getImageProvider(String imageUrl) {
    try {
      if (imageUrl.isNotEmpty) {
        return NetworkImage(imageUrl);
      } else {
        return const AssetImage('assets/user_photo.png');
      }
    } catch (e) {
      return const AssetImage('assets/user_photo.png');
    }
  }
}
