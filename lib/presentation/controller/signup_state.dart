import 'package:equatable/equatable.dart';
import 'package:gammal_tech_final_exam/core/utils/enums.dart';

class SignupState extends Equatable {
  final bool? isSuccess;
  final String? verficationcode;
  final String email;
  final String errorMessage;
  final RequestState requestState;

  const SignupState({
    this.isSuccess,
    this.errorMessage = "",
    this.requestState = RequestState.loading,
    this.verficationcode = "",
    this.email = "",
  });

  SignupState copyWith({
    bool? isSuccess,
    String? errorMessage,
    RequestState? requestState,
    String? verficationcode,
    String? email,
  }) {
    return SignupState(
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage ?? this.errorMessage,
      requestState: requestState ?? this.requestState,
      verficationcode: verficationcode ?? this.verficationcode,
      email: email ?? this.email,
    );
  }

  @override
  List<Object?> get props =>
      [isSuccess, errorMessage, requestState, verficationcode];
}
