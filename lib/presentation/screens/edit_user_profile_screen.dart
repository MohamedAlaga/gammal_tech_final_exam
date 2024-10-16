import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gammal_tech_final_exam/presentation/components/accept_custom_dialoge.dart';
import 'package:gammal_tech_final_exam/presentation/components/custom_dialog.dart';
import 'package:gammal_tech_final_exam/presentation/components/custom_text_field.dart';
import 'package:gammal_tech_final_exam/presentation/components/sub_app_bar.dart';
import 'package:gammal_tech_final_exam/presentation/controller/user_profile_bloc.dart';
import 'package:gammal_tech_final_exam/presentation/controller/user_profile_event.dart';
import 'package:gammal_tech_final_exam/presentation/controller/user_profile_state.dart';

import '../components/custom_button.dart';

class EditUserProfileScreen extends StatelessWidget {
  EditUserProfileScreen({super.key});
  final TextEditingController university = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SubAppBar(
        appBarColor: Colors.white,
        iconsColor: const Color(0xff094546),
        onRightIconPressed: () {},
      ),
      backgroundColor: Colors.white,
      body: BlocBuilder<UserProfileBloc, UserProfileState>(
          builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/user_photo.png'),
                    backgroundColor: Colors.grey,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    state.currentUser.name,
                    style: const TextStyle(fontSize: 18, color: Colors.black),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        state.currentUser.collegeName,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black.withOpacity(0.7),
                        ),
                        overflow:
                            TextOverflow.ellipsis, // Handles text overflow
                      )
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    state.currentUser.bio,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black.withOpacity(0.7),
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 18),
                  CustomTextField(hint: "university", controller: university),
                  const SizedBox(height: 18),
                  CustomTextField(hint: "email", controller: email),
                  const SizedBox(height: 18),
                  CustomTextField(
                      hint: "phone number", controller: phoneNumber),
                  const SizedBox(height: 36),
                  CustomButton(
                    text: 'Confirm',
                    textColor: Colors.white,
                    buttonColor: const Color(0xff094546),
                    borderColor: const Color(0xff094546),
                    width: MediaQuery.of(context).size.width,
                    borderRadius: 8,
                    fontSize: 20,
                    onTap: () {
                      if (university.text.isEmpty &&
                          email.text.isEmpty &&
                          phoneNumber.text.isEmpty) {
                        showDialog(
                            context: context,
                            builder: (context) => AcceptCustomDialoge(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  title: "Please fill at least one field",
                                ));
                      } else {
                        showDialog(
                            context: context,
                            builder: (context) => CustomDialog(
                                  onTap: () {
                                    BlocProvider.of<UserProfileBloc>(context)
                                        .add(UpdateUserProfileEvent(
                                            university: university.text.isEmpty
                                                ? null
                                                : university.text,
                                            email: email.text.isEmpty
                                                ? null
                                                : email.text,
                                            phoneNumber:
                                                phoneNumber.text.isEmpty
                                                    ? null
                                                    : phoneNumber.text));
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  },
                                  title: "Edit Profile data",
                                  content:
                                      "are you sure you want to edit your profile data",
                                ));
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
