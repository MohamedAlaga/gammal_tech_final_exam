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
  final String? bio;
  final String? imageUrl;
  final String? name;

  UpdateUserProfileEvent(
      {this.university,
      this.email,
      this.phoneNumber,
      this.bio,
      this.imageUrl,
      this.name});
}
