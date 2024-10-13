import 'package:equatable/equatable.dart';

class UserEvents extends Equatable {
  const UserEvents();

  @override
  List<Object?> get props => [];
}

class LoginUserEvent extends UserEvents {
  final String email;
  final String password;

  const LoginUserEvent({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

class GetWelcomeUserData extends UserEvents {}
class ValidateUserEvent extends UserEvents {}
