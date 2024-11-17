import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gammal_tech_final_exam/core/utils/enums.dart';
import 'package:gammal_tech_final_exam/domain/usecase/signup_user_usecase.dart';
import 'package:gammal_tech_final_exam/domain/usecase/verify_otp_usecase.dart';
import 'package:gammal_tech_final_exam/presentation/components/custom_toast.dart';
import 'package:gammal_tech_final_exam/presentation/controller/signup_events.dart';
import 'package:gammal_tech_final_exam/presentation/controller/signup_state.dart';
import 'package:gammal_tech_final_exam/presentation/screens/main_screen.dart';
import 'package:gammal_tech_final_exam/presentation/screens/verify_otp_screen.dart';

class SignupBloc extends Bloc<SignupEvents, SignupState> {
  SignupUserUsecase signupUserUsecase;
  VerifyOtpUsecase verifyOtpUsecase;

  SignupBloc(this.signupUserUsecase, this.verifyOtpUsecase)
      : super(const SignupState()) {
    on<StartSignupEvent>((event, emit) async {
      showDialog(
          context: event.context,
          builder: (context) => const Center(
                child: SizedBox(
                    height: 36, width: 36, child: CircularProgressIndicator()),
              ));
      var result = await signupUserUsecase.execute(
          event.email, event.password, event.name);
      result.fold((l) {
        Navigator.maybePop(event.context);
        showRedToast(l.message);
        return emit(SignupState(
            errorMessage: l.message,
            isSuccess: false,
            requestState: RequestState.error));
      }, (r) {
        Navigator.maybePop(event.context);
        Navigator.pushReplacement(event.context,
            MaterialPageRoute(builder: (context) => VerifyOtpScreen()));
        return emit(SignupState(
            email: event.email,
            isSuccess: true,
            requestState: RequestState.loaded));
      });
    });
    on<VerifySignupEvent>((event, emit) async {
      showDialog(
          context: event.context,
          builder: (context) => const Center(
                child: SizedBox(
                    height: 36, width: 36, child: CircularProgressIndicator()),
              ));
      var result =
          await verifyOtpUsecase.execute(state.email, event.verificationCode);
      result.fold((l) {
        Navigator.maybePop(event.context);
        showRedToast(l.message);
        return emit(state.copyWith(
          errorMessage: l.message,
          requestState: RequestState.error,
        ));
      }, (r) {
        showGreenToast("Account Verified");
        Navigator.pushAndRemoveUntil(event.context, MaterialPageRoute(
          builder: (context) {
            return const MainScreen();
          },
        ), (route) => false);
        return emit(const SignupState());
      });
    });
  }
}
