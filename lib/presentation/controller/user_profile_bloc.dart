import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gammal_tech_final_exam/core/utils/enums.dart';
import 'package:gammal_tech_final_exam/domain/usecase/get_user_profile_data_usecase.dart';
import 'package:gammal_tech_final_exam/domain/usecase/update_user_data_usecase.dart';
import 'package:gammal_tech_final_exam/presentation/components/custom_toast.dart';
import 'package:gammal_tech_final_exam/presentation/controller/user_profile_event.dart';
import 'package:gammal_tech_final_exam/presentation/controller/user_profile_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  GetUserProfileDataUsecase getUserProfileDataUsecase;
  UpdateUserDataUsecase updateUserDataUsecase;
  UserProfileBloc(this.getUserProfileDataUsecase, this.updateUserDataUsecase)
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
      final result = await updateUserDataUsecase.execute(
          event.university,
          event.email,
          event.phoneNumber,
          event.bio,
          event.imageUrl,
          event.name);
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
  }
}
