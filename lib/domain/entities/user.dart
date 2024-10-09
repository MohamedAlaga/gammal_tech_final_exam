import 'package:equatable/equatable.dart';
import 'package:gammal_tech_final_exam/data/models/contact_info_model.dart';

class User extends Equatable {
  final String name;
  final String collegeName;
  final String bio;
  final List<ContactInfoModel> contactInfo;
  final List<String> skills;
  final Map<String, double> progress;
  final String imageUrl;

  const User({
    required this.name,
    required this.collegeName,
    required this.bio,
    required this.contactInfo,
    required this.skills,
    required this.progress,
    required this.imageUrl,
  });

  @override
  List<Object?> get props =>
      [name, collegeName, bio, contactInfo, skills, progress, imageUrl];
}
