import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gammal_tech_final_exam/core/utils/enums.dart';
import 'package:gammal_tech_final_exam/domain/usecase/get_user_profile_data_usecase.dart';
import 'package:gammal_tech_final_exam/domain/usecase/update_image_usecase.dart';
import 'package:gammal_tech_final_exam/domain/usecase/update_user_data_usecase.dart';
import 'package:gammal_tech_final_exam/presentation/components/custom_dialog.dart';
import 'package:gammal_tech_final_exam/presentation/components/custom_toast.dart';
import 'package:gammal_tech_final_exam/presentation/controller/user_bloc.dart';
import 'package:gammal_tech_final_exam/presentation/controller/user_events.dart';
import 'package:gammal_tech_final_exam/presentation/controller/user_profile_event.dart';
import 'package:gammal_tech_final_exam/presentation/controller/user_profile_state.dart';
import 'package:image_picker/image_picker.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  GetUserProfileDataUsecase getUserProfileDataUsecase;
  UpdateUserDataUsecase updateUserDataUsecase;
  UpdateImageUsecase updateImageUsecase;
  UserProfileBloc(this.getUserProfileDataUsecase, this.updateUserDataUsecase,
      this.updateImageUsecase)
      : super(const UserProfileState()) {
    on<GetUserProfileEvent>((event, emit) async {
      final result = await getUserProfileDataUsecase.execute();
      result.fold(
          (l) => emit(UserProfileState(
              requestState: RequestState.error, errorMessage: l.message)),
          (r) => emit(UserProfileState(
              requestState: RequestState.loaded, currentUser: r)));
    });
    on<UpdateUserProfileEvent>((event, emit) async {
      final result = await updateUserDataUsecase.execute(event.university,
          event.email, event.phoneNumber, event.bio, event.name);
      result.fold((l) {
        showRedToast("Error occures updating user profile, please try again");
      }, (r) {
        showGreenToast("User profile updated successfully");
        return emit(UserProfileState(
          currentUser: r,
          requestState: RequestState.loaded,
        ));
      });
    });

    on<UpdateUserImageEvent>((event, emit) async {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        showDialog(
          context: event.context,
          builder: (dialogContext) => CustomDialog(
            title: "Update profile picture",
            content: "Are you sure you want to update your picture?",
            onTap: () async {
              Navigator.of(dialogContext).pop();
              BuildContext? progressContext;
              showDialog(
                context: event.context,
                barrierDismissible: false,
                builder: (context) {
                  progressContext = context;
                  return const Center(
                    child: SizedBox(
                      height: 36,
                      width: 36,
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
              );
              final result = await updateImageUsecase.execute(
                File(pickedFile.path),
                event.email,
              );
              event.context.read<UserProfileBloc>().add(GetUserProfileEvent());
              event.context.read<UserBloc>().add(GetWelcomeUserData());
              if (progressContext != null) {
                Navigator.of(progressContext!).pop();
              }
              result.fold(
                (l) => showRedToast(l.message),
                (r) {
                  return showGreenToast("User image updated successfully");
                },
              );
            },
          ),
        );
      }
    });
  }
}
