import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gammal_tech_final_exam/core/utils/enums.dart';
import 'package:gammal_tech_final_exam/domain/usecase/get_user_welcome_data_usecase.dart';
import 'package:gammal_tech_final_exam/domain/usecase/login_user_usecase.dart';
import 'package:gammal_tech_final_exam/domain/usecase/validate_user_token_usecase.dart';
import 'package:gammal_tech_final_exam/presentation/components/custom_toast.dart';
import 'package:gammal_tech_final_exam/presentation/controller/user_events.dart';
import 'package:gammal_tech_final_exam/presentation/controller/user_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserBloc extends Bloc<UserEvents, UserState> {
  final LoginUserUsecase loginUserUsecase;
  final GetUserWelcomeDataUsecase getUserWelcomeDataUsecase;
  final ValidateUserTokenUsecase validateUserTokenUsecase;
  UserBloc(this.loginUserUsecase, this.getUserWelcomeDataUsecase,
      this.validateUserTokenUsecase)
      : super(const UserState()) {
    on<LoginUserEvent>((event, emit) async {
      showDialog(
          context: event.context,
          builder: (context) => const Center(
            child: SizedBox(
                height: 36, width: 36, child: CircularProgressIndicator()),
          ));
      var result = await loginUserUsecase.execute(event.email, event.password);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      Navigator.maybePop(event.context);
      result.fold((l) {
        showRedToast("invalid email or password");
        return emit(UserState(
            loginRequestState: RequestState.error,
            loginErrorMessage: l.message));
      }, (r) {
        showGreenToast("Welcome back");
        return emit(UserState(
          loginRequestState: RequestState.loaded,
          userid: prefs.getString("userid").toString(),
        ));
      });
    });
    on<GetWelcomeUserData>((event, emit) async {
      var result = await getUserWelcomeDataUsecase
          .execute();
      result.fold(
          (l) => emit(state.copyWith(
              welcomeRequestState: RequestState.error,
              welcomeErrorMessage: l.message)),
          (r) => emit(state.copyWith(
                welcomeRequestState: RequestState.loaded,
                welcomeData: r,
              )));
    });
    on<ValidateUserEvent>((event, emit) async {
      var result = await validateUserTokenUsecase.execute();
      result.fold(
          (l) => emit(state.copyWith(
              loginRequestState: RequestState.error,
              loginErrorMessage: l.message)), (r) {
        showGreenToast("Welcome back");
        return emit(state.copyWith(
          loginRequestState: RequestState.loaded,
        ));
      });
    });
  }
}
