import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ResetPassEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class StartResetPassEvent extends ResetPassEvent {
  final BuildContext context;
  final String email;
  StartResetPassEvent(this.email, this.context);
}

class VerifyOtpEvent extends ResetPassEvent {
  final BuildContext context;
  final String otp;
  VerifyOtpEvent(this.otp, this.context);
}

class FinishResetPassword extends ResetPassEvent {
  final BuildContext context;
  final String newPassword;
  FinishResetPassword(this.newPassword, this.context);
}
