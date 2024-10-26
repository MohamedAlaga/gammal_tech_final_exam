import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gammal_tech_final_exam/core/utils/enums.dart';
import 'package:gammal_tech_final_exam/presentation/components/card_info.dart';
import 'package:gammal_tech_final_exam/presentation/components/custom_button.dart';
import 'package:gammal_tech_final_exam/presentation/components/custom_text_dialog.dart';
import 'package:gammal_tech_final_exam/presentation/components/custom_toast.dart';
import 'package:gammal_tech_final_exam/presentation/components/progress_card.dart';
import 'package:gammal_tech_final_exam/presentation/components/skills_list.dart';
import 'package:gammal_tech_final_exam/presentation/controller/user_bloc.dart';
import 'package:gammal_tech_final_exam/presentation/controller/user_profile_bloc.dart';
import 'package:gammal_tech_final_exam/presentation/controller/user_profile_event.dart';
import 'package:gammal_tech_final_exam/presentation/controller/user_profile_state.dart';
import 'package:gammal_tech_final_exam/presentation/screens/main_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/sub_app_bar.dart';
import '../controller/user_events.dart';

class UserProfileScreen extends StatelessWidget {
  UserProfileScreen({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final TextEditingController collegeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
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
                        radius: 50,
                        backgroundImage: _getImageProvider(
                          state.currentUser.imageUrl,
                        ),
                        backgroundColor: Colors.white,
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            state.currentUser.name,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              showGeneralDialog(
                                context: context,
                                transitionDuration:
                                    const Duration(milliseconds: 300),
                                barrierDismissible: true,
                                barrierLabel: '',
                                transitionBuilder: (context, a1, a2, widget) {
                                  final curvedValue =
                                      Curves.easeInOutBack.transform(a1.value) -
                                          1.0;
                                  return Transform(
                                    transform: Matrix4.translationValues(
                                        0.0, curvedValue * 200, 0.0),
                                    child: Opacity(
                                      opacity: a1.value,
                                      child: CustomTextDialog(
                                        controller: nameController,
                                        acceptText: "Save",
                                        cancelText: "",
                                        title: "Edit your name",
                                        hintText: "Name",
                                        onAccept: () {
                                          if (nameController.text.isNotEmpty) {
                                            BlocProvider.of<UserProfileBloc>(
                                                    context)
                                                .add(
                                              UpdateUserProfileEvent(
                                                name: nameController.text,
                                              ),
                                            );
                                            Navigator.pop(context);
                                          } else {
                                            Navigator.pop(context);
                                            showRedToast(
                                                "Please enter a valid name");
                                          }
                                        },
                                      ),
                                    ),
                                  );
                                },
                                pageBuilder: (context, animation1, animation2) {
                                  return const SizedBox();
                                },
                              );
                            },
                            icon: const Icon(
                              Icons.edit,
                              size: 20,
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            state.currentUser.collegeName,
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black.withOpacity(0.7)),
                          ),
                          IconButton(
                            onPressed: () {
                              showGeneralDialog(
                                context: context,
                                transitionDuration:
                                    const Duration(milliseconds: 300),
                                barrierDismissible: true,
                                barrierLabel: '',
                                transitionBuilder: (context, a1, a2, widget) {
                                  final curvedValue =
                                      Curves.easeInOutBack.transform(a1.value) -
                                          1.0;
                                  return Transform(
                                    transform: Matrix4.translationValues(
                                        0.0, curvedValue * 200, 0.0),
                                    child: Opacity(
                                      opacity: a1.value,
                                      child: CustomTextDialog(
                                        controller: collegeController,
                                        acceptText: "Save",
                                        cancelText: "",
                                        title: "Edit your university",
                                        hintText: "University Name",
                                        onAccept: () {
                                          if (collegeController
                                              .text.isNotEmpty) {
                                            BlocProvider.of<UserProfileBloc>(
                                                    context)
                                                .add(
                                              UpdateUserProfileEvent(
                                                university:
                                                    collegeController.text,
                                              ),
                                            );
                                            Navigator.pop(context);
                                          } else {
                                            Navigator.pop(context);
                                            showRedToast(
                                                "Please enter a valid university name");
                                          }
                                        },
                                      ),
                                    ),
                                  );
                                },
                                pageBuilder: (context, animation1, animation2) {
                                  return const SizedBox();
                                },
                              );
                            },
                            icon: const Icon(
                              Icons.edit,
                              size: 20,
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Text(
                              state.currentUser.bio,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black.withOpacity(0.7)),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              showGeneralDialog(
                                context: context,
                                transitionDuration:
                                    const Duration(milliseconds: 300),
                                barrierDismissible: true,
                                barrierLabel: '',
                                transitionBuilder: (context, a1, a2, widget) {
                                  final curvedValue =
                                      Curves.easeInOutBack.transform(a1.value) -
                                          1.0;
                                  return Transform(
                                    transform: Matrix4.translationValues(
                                        0.0, curvedValue * 200, 0.0),
                                    child: Opacity(
                                      opacity: a1.value,
                                      child: CustomTextDialog(
                                        controller: bioController,
                                        acceptText: "Save",
                                        cancelText: "",
                                        title: "Edit your bio",
                                        hintText: "Bio",
                                        onAccept: () {
                                          if (bioController.text.isNotEmpty) {
                                            BlocProvider.of<UserProfileBloc>(
                                                    context)
                                                .add(
                                              UpdateUserProfileEvent(
                                                bio: bioController.text,
                                              ),
                                            );
                                            Navigator.pop(context);
                                          } else {
                                            Navigator.pop(context);
                                            showRedToast(
                                                "Please enter a valid bio");
                                          }
                                        },
                                      ),
                                    ),
                                  );
                                },
                                pageBuilder: (context, animation1, animation2) {
                                  return const SizedBox();
                                },
                              );
                            },
                            icon: const Icon(
                              Icons.edit,
                              size: 20,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 12),
                      CardInfo(
                        borderColor: const Color(0xFFFF904D),
                        info: "Email",
                        information: state.currentUser.email,
                      ),
                      CardInfo(
                        borderColor: const Color(0xFFFF904D),
                        info: "Phone number",
                        information: state.currentUser.phone,
                      ),
                      CardInfo(
                        borderColor: const Color(0xFFFF904D),
                        info: "Points",
                        information: state.currentUser.totalPoints.toString(),
                      ),
                      CardInfo(
                        borderColor: const Color(0xFFFF904D),
                        info: "Attempts left",
                        information:
                            state.currentUser.attemptsRemaining.toString(),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          Expanded(
                            child: CustomButton(
                              width: double.infinity,
                              text: 'Edit email',
                              textColor: Colors.white,
                              buttonColor: const Color(0xff094546),
                              borderColor: const Color(0xff094546),
                              borderRadius: 8,
                              fontSize: 20,
                              onTap: () {
                                showGeneralDialog(
                                  context: context,
                                  transitionDuration:
                                      const Duration(milliseconds: 300),
                                  barrierDismissible: true,
                                  barrierLabel: '',
                                  transitionBuilder: (context, a1, a2, widget) {
                                    final curvedValue = Curves.easeInOutBack
                                            .transform(a1.value) -
                                        1.0;
                                    return Transform(
                                      transform: Matrix4.translationValues(
                                          0.0, curvedValue * 200, 0.0),
                                      child: Opacity(
                                        opacity: a1.value,
                                        child: CustomTextDialog(
                                          controller: emailController,
                                          acceptText: "Save",
                                          cancelText: "",
                                          title: "Edit your email",
                                          hintText: "Email",
                                          onAccept: () {
                                            if (emailController
                                                .text.isNotEmpty) {
                                              BlocProvider.of<UserProfileBloc>(
                                                      context)
                                                  .add(
                                                UpdateUserProfileEvent(
                                                  email: emailController.text,
                                                ),
                                              );
                                              Navigator.pop(context);
                                            } else {
                                              Navigator.pop(context);
                                              showRedToast(
                                                  "Please enter a valid email");
                                            }
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                  pageBuilder:
                                      (context, animation1, animation2) {
                                    return const SizedBox();
                                  },
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: CustomButton(
                              width: double.infinity,
                              text: 'Edit phone',
                              textColor: Colors.white,
                              buttonColor: const Color(0xff094546),
                              borderColor: const Color(0xff094546),
                              borderRadius: 8,
                              fontSize: 20,
                              onTap: () {
                                showGeneralDialog(
                                  context: context,
                                  transitionDuration:
                                      const Duration(milliseconds: 300),
                                  barrierDismissible: true,
                                  barrierLabel: '',
                                  transitionBuilder: (context, a1, a2, widget) {
                                    final curvedValue = Curves.easeInOutBack
                                            .transform(a1.value) -
                                        1.0;
                                    return Transform(
                                      transform: Matrix4.translationValues(
                                          0.0, curvedValue * 200, 0.0),
                                      child: Opacity(
                                        opacity: a1.value,
                                        child: CustomTextDialog(
                                          controller: phoneNumberController,
                                          acceptText: "Save",
                                          cancelText: "",
                                          title: "Edit your phone number",
                                          hintText: "Phone Number",
                                          onAccept: () {
                                            if (phoneNumberController
                                                .text.isNotEmpty) {
                                              BlocProvider.of<UserProfileBloc>(
                                                      context)
                                                  .add(
                                                UpdateUserProfileEvent(
                                                  phoneNumber:
                                                      phoneNumberController
                                                          .text,
                                                ),
                                              );
                                              Navigator.pop(context);
                                            } else {
                                              Navigator.pop(context);
                                              showRedToast(
                                                  "Please enter a valid phone number");
                                            }
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                  pageBuilder:
                                      (context, animation1, animation2) {
                                    return const SizedBox();
                                  },
                                );
                              },
                            ),
                          )
                        ],
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
                        ),
                      const SizedBox(height: 18),
                      CustomButton(
                        text: 'Logout',
                        textColor: Colors.white,
                        buttonColor: Colors.red,
                        borderColor: Colors.red,
                        borderRadius: 8,
                        onTap: () async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          await prefs.remove("token");
                          await prefs.remove("userId");
                          BlocProvider.of<UserBloc>(context).add(
                            ValidateUserEvent(),
                          );
                          Navigator.pushAndRemoveUntil<dynamic>(
                            context,
                            MaterialPageRoute<dynamic>(
                              builder: (BuildContext context) => MainScreen(),
                            ),
                            (route) => false,
                          );
                        },
                        fontSize: 18,
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
