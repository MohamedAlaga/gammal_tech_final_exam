import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String name;
  final String email;
  final String phone;
  final String collegeName;
  final String bio;
  final int attemptsRemaining;
  final int totalPoints;
  final List<String> skills;
  final Map<String, double> progress;
  final String imageUrl;

  const User({
    required this.name,
    required this.email,
    required this.phone,
    required this.collegeName,
    required this.bio,
    required this.attemptsRemaining,
    required this.totalPoints,
    required this.skills,
    required this.progress,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [
        name,
        email,
        phone,
        collegeName,
        bio,
        attemptsRemaining,
        totalPoints,
        skills,
        progress,
        imageUrl,
      ];
}
