import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gammal_tech_final_exam/core/utils/enums.dart';
import 'package:gammal_tech_final_exam/domain/usecase/reset_password_request_usecase.dart';
import 'package:gammal_tech_final_exam/domain/usecase/reset_password_usecase.dart';
import 'package:gammal_tech_final_exam/domain/usecase/verify_otp_usecase.dart';
import 'package:gammal_tech_final_exam/presentation/components/custom_toast.dart';
import 'package:gammal_tech_final_exam/presentation/controller/reset_pass_event.dart';
import 'package:gammal_tech_final_exam/presentation/controller/reset_pass_state.dart';
import 'package:gammal_tech_final_exam/presentation/screens/main_screen.dart';
import 'package:gammal_tech_final_exam/presentation/screens/verify_otp_screen.dart';
import 'package:gammal_tech_final_exam/presentation/screens/set_new_pass_screen.dart';

class ResetPassBloc extends Bloc<ResetPassEvent, ResetPassState> {
  ResetPasswordRequestUsecase resetPasswordRequestUsecase;
  VerifyOtpUsecase verifyOtpUsecase;
  ResetPasswordUsecase resetPasswordUsecase;

  ResetPassBloc(this.resetPasswordRequestUsecase, this.verifyOtpUsecase,
      this.resetPasswordUsecase)
      : super(const ResetPassState()) {
    on<StartResetPassEvent>(
      (event, emit) async {
        showDialog(
            context: event.context,
            builder: (context) => const Center(
                  child: SizedBox(
                      height: 36,
                      width: 36,
                      child: CircularProgressIndicator()),
                ));
        var result = await resetPasswordRequestUsecase.execute(event.email);
        result.fold((l) {
          Navigator.maybePop(event.context);
          showRedToast(l.message);
          return emit(ResetPassState(
            errorMessage: l.message,
            requestState: RequestState.error,
          ));
        }, (r) {
          Navigator.maybePop(event.context);
          Navigator.pushReplacement(event.context,
              MaterialPageRoute(builder: (context) => VerifyOtpScreen()));
          return emit(ResetPassState(
            email: event.email,
            requestState: RequestState.loaded,
          ));
        });
      },
    );

    on<VerifyOtpEvent>(
      (event, emit) async {
        showDialog(
            context: event.context,
            builder: (context) => const Center(
                  child: SizedBox(
                      height: 36,
                      width: 36,
                      child: CircularProgressIndicator()),
                ));
        emit(state.copyWith(requestState: RequestState.loading));
        var result = await verifyOtpUsecase.execute(state.email, event.otp);
        result.fold((l) {
          Navigator.maybePop(event.context);
          showRedToast(l.message);
          return emit(state.copyWith(
            errorMessage: l.message,
            requestState: RequestState.error,
          ));
        }, (r) {
          Navigator.maybePop(event.context);
          Navigator.pushReplacement(event.context,
              MaterialPageRoute(builder: (context) => SetNewPassScreen()));
          return emit(state.copyWith(
            otp: event.otp,
            requestState: RequestState.loaded,
          ));
        });
      },
    );

    on<FinishResetPassword>(
      (event, emit) async {
        showDialog(
            context: event.context,
            builder: (context) => const Center(
                  child: SizedBox(
                      height: 36,
                      width: 36,
                      child: CircularProgressIndicator()),
                ));
        emit(state.copyWith(requestState: RequestState.loading));
        var result = await resetPasswordUsecase.execute(
            state.email, state.otp, event.newPassword);

        result.fold((l) {
          Navigator.maybePop(event.context);
          showRedToast(l.message);
          emit(state.copyWith(
            errorMessage: l.message,
            requestState: RequestState.error,
          ));
        }, (r) {
          showGreenToast("Password reset successfully");
          Navigator.pushAndRemoveUntil(
              event.context,
              MaterialPageRoute(builder: (context) => const MainScreen()),
              (route) => false);
          emit(const ResetPassState());
        });
      },
    );
  }
}
