import 'package:equatable/equatable.dart';
import 'package:gammal_tech_final_exam/core/utils/enums.dart';

class ResetPassState extends Equatable {
  final String otp;
  final String email;
  final String errorMessage;
  final RequestState requestState;

  const ResetPassState({
    this.otp = "",
    this.email = "",
    this.errorMessage = "",
    this.requestState = RequestState.loading,
  });

  ResetPassState copyWith({
    String? otp,
    String? email,
    String? newPassword,
    String? errorMessage,
    RequestState? requestState,
  }) {
    return ResetPassState(
      otp: otp ?? this.otp,
      email: email ?? this.email,
      errorMessage: errorMessage ?? this.errorMessage,
      requestState: requestState ?? this.requestState,
    );
  }

  @override
  List<Object?> get props =>
      [otp, email, errorMessage, requestState];
}
