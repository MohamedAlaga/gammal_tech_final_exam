import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class SignupEvents extends Equatable {
  @override
  List<Object?> get props => [];
}

class StartSignupEvent extends SignupEvents {
  final String email;
  final String password;
  final String name;
  final BuildContext context;
  StartSignupEvent(this.email, this.password, this.name, this.context);
}

class VerifySignupEvent extends SignupEvents {
  final String verificationCode;
  final BuildContext context;
  VerifySignupEvent(this.verificationCode, this.context);
}
