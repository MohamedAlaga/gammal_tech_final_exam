import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gammal_tech_final_exam/core/utils/enums.dart';
import 'package:gammal_tech_final_exam/presentation/components/card_info.dart';
import 'package:gammal_tech_final_exam/presentation/components/custom_button.dart';
import 'package:gammal_tech_final_exam/presentation/components/progress_card.dart';
import 'package:gammal_tech_final_exam/presentation/components/skills_list.dart';
import 'package:gammal_tech_final_exam/presentation/controller/user_bloc.dart';
import 'package:gammal_tech_final_exam/presentation/controller/user_profile_bloc.dart';
import 'package:gammal_tech_final_exam/presentation/controller/user_profile_state.dart';
import 'package:gammal_tech_final_exam/presentation/screens/edit_user_profile_screen.dart';

import '../components/sub_app_bar.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SubAppBar(
        appBarColor: Colors.white,
        iconsColor: Color(0xff094546),
      ),
      backgroundColor: Colors.white,
      body: BlocBuilder<UserProfileBloc, UserProfileState>(
          builder: (context, state) {
        switch (state.requestState) {
          case RequestState.loading:
            return const Center(child: CircularProgressIndicator());
          case RequestState.error:
            return const Center(child: Text('Error'));
          default:
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Center(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundImage:
                            _getImageProvider(state.currentUser.imageUrl),
                        backgroundColor: Colors.grey[400],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        state.currentUser.name,
                        style:
                            const TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        state.currentUser.collegeName,
                        style: TextStyle(
                            fontSize: 16, color: Colors.black.withOpacity(0.7)),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        state.currentUser.bio,
                        style: TextStyle(
                            fontSize: 14, color: Colors.black.withOpacity(0.7)),
                      ),
                      const SizedBox(height: 18),
                      CardInfo(
                        borderColor: const Color(0xffE3E5E8),
                        info: "Email",
                        information: state.currentUser.email,
                      ),
                      CardInfo(
                        borderColor: const Color(0xffE3E5E8),
                        info: "Phone number",
                        information: state.currentUser.phone,
                      ),
                      CardInfo(
                        borderColor: const Color(0xffE3E5E8),
                        info: "Points",
                        information: state.currentUser.totalPoints.toString(),
                      ),
                      CardInfo(
                        borderColor: const Color(0xffE3E5E8),
                        info: "Attempts left",
                        information:
                            state.currentUser.attemptsRemaining.toString(),
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
                            PageRouteBuilder(
                              transitionDuration:
                                  const Duration(milliseconds: 140),
                              transitionsBuilder: (context, firstAnimation,
                                  secondaryAnimation, child) {
                                return SlideTransition(
                                  position: Tween<Offset>(
                                    begin: const Offset(-1.0, 0.0),
                                    end: Offset.zero,
                                  ).animate(firstAnimation),
                                  child: child,
                                );
                              },
                              pageBuilder: (context, firstAnimation,
                                      secondaryAnimation) =>
                                  MultiBlocProvider(
                                providers: [
                                  BlocProvider.value(
                                    value: BlocProvider.of<UserBloc>(context),
                                  )
                                ],
                                child: EditUserProfileScreen(),
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 24),
                      state.currentUser.skills.isNotEmpty
                          ? Align(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                children: [
                                  const Text(
                                    'Skills:',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 12),
                                  SkillsList(skills: state.currentUser.skills),
                                  const SizedBox(height: 24),
                                ],
                              ),
                            )
                          : const SizedBox(),
                      const Row(
                        children: [
                          Text(
                            'Progress:',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      for (var course in state.currentUser.progress.keys)
                        ProgressCard(
                          courseTitle: course,
                          progress: state.currentUser.progress[course]!,
                        )
                    ],
                  ),
                ),
              ),
            );
        }
      }),
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
