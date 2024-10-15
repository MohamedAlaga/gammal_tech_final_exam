import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gammal_tech_final_exam/core/utils/enums.dart';
import 'package:gammal_tech_final_exam/domain/usecase/get_user_profile_data_usecase.dart';
import 'package:gammal_tech_final_exam/presentation/controller/user_profile_event.dart';
import 'package:gammal_tech_final_exam/presentation/controller/user_profile_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  GetUserProfileDataUsecase getUserProfileDataUsecase;
  UserProfileBloc(this.getUserProfileDataUsecase)
      : super(const UserProfileState()) {
    on<GetUserProfileEvent>((event, emit) async {
      final result = await getUserProfileDataUsecase
          .execute();
      result.fold(
          (l) => emit(UserProfileState(
              requestState: RequestState.error, errorMessage: l.message)),
          (r) => emit(UserProfileState(
              requestState: RequestState.loaded, currentUser: r)));
    });
  }
}
