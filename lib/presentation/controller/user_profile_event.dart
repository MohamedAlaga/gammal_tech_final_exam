import 'package:equatable/equatable.dart';

class UserProfileEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetUserProfileEvent extends UserProfileEvent {}

class UpdateUserProfileEvent extends UserProfileEvent {
  final String? university;
  final String? email;
  final String? phoneNumber;

  UpdateUserProfileEvent({this.university, this.email, this.phoneNumber});
}
