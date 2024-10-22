import 'package:gammal_tech_final_exam/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.bio,
    required super.collegeName,
    required super.imageUrl,
    required super.name,
    required super.progress,
    required super.skills,
    required super.totalPoints,
    required super.attemptsRemaining,
    required super.email,
    required super.phone,
  });

  factory UserModel.fromJson(
      Map<String, dynamic> json, Map<String, double> progress) {
    List<String> skills = [];
    if (json['skills'] != null) {
      for (var skill in progress.keys) {
        if (progress[skill] == 1.0) {
          skills.add(skill);
        }
      }
    }
    return UserModel(
      bio: json['bio'] ?? "Gammal Tech Learner Exploring Coding Challenges",
      collegeName: json['university'] ?? "user college",
      imageUrl: json['imageUrl'] ?? "",
      name: json['name'] ?? "user name",
      progress: progress,
      skills: skills,
      totalPoints: json['total_points'],
      attemptsRemaining: json['attempts_remaining'],
      email: json['email'],
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'bio': bio,
      'collegeName': collegeName,
      'imageUrl': imageUrl,
      'name': name,
      'progress': progress,
      'skills': skills,
      'totalPoints': totalPoints,
      'attemptsRemaining': attemptsRemaining,
      'email': email,
      'phone': phone,
    };
  }

  UserModel copyWith({
    String? bio,
    String? collegeName,
    String? imageUrl,
    String? name,
    Map<String, double>? progress,
    List<String>? skills,
    int? totalPoints,
    int? attemptsRemaining,
    String? email,
    String? phone,
  }) {
    return UserModel(
      bio: bio ?? this.bio,
      collegeName: collegeName ?? this.collegeName,
      imageUrl: imageUrl ?? this.imageUrl,
      name: name ?? this.name,
      progress: progress ?? this.progress,
      skills: skills ?? this.skills,
      totalPoints: totalPoints ?? this.totalPoints,
      attemptsRemaining: attemptsRemaining ?? this.attemptsRemaining,
      email: email ?? this.email,
      phone: phone ?? this.phone,
    );
  }
}
