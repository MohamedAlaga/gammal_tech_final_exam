import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class UserEvents extends Equatable {
  const UserEvents();

  @override
  List<Object?> get props => [];
}

class LoginUserEvent extends UserEvents {
  final String email;
  final String password;
  final BuildContext context;

  const LoginUserEvent({required this.email, required this.password, required this.context});

  @override
  List<Object?> get props => [email, password];
}

class GetWelcomeUserData extends UserEvents {}
class ValidateUserEvent extends UserEvents {}
