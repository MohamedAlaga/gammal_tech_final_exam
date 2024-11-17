import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

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
  final String? name;

  UpdateUserProfileEvent(
      {this.university, this.email, this.phoneNumber, this.bio, this.name});
}

class UpdateUserImageEvent extends UserProfileEvent {
  final BuildContext context;
  final String email;

  UpdateUserImageEvent({required this.context, required this.email});
}
