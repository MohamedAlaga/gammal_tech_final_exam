import 'package:gammal_tech_final_exam/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.bio,
    required super.collegeName,
    required super.contactInfo,
    required super.imageUrl,
    required super.name,
    required super.progress,
    required super.skills,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      collegeName: json['collegeName'],
      bio: json['bio'],
      contactInfo: json['contactInfo'],
      skills: json['skills'],
      progress: json['progress'],
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'collegeName': collegeName,
      'bio': bio,
      'contactInfo': contactInfo,
      'skills': skills,
      'progress': progress,
      'imageUrl': imageUrl,
    };
  }
}
