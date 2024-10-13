import 'package:gammal_tech_final_exam/core/utils/env.dart';
import 'package:gammal_tech_final_exam/domain/entities/topic.dart';

class TopicModel extends Topic {
  const TopicModel({
    required super.id,
    required super.duration,
    required super.title,
    required super.subtitle,
    required super.description,
    required super.imageUrl,
    required super.skills,
    required super.points,
    required super.quizCount,
    required super.isCompleted,
  });

  factory TopicModel.fromJson(Map<String, dynamic> json) {
    return TopicModel(
      id: json['id'].toString(),
      duration: json['duration_in_seconds'] ?? 10,
      title: json['title'],
      subtitle: json['sub_title'] ?? "subtitle",
      description: json['description'] ?? "description",
      imageUrl: json['image_url'] ?? courseImageUrl,
      skills: json['skills_needed'] ?? "skills",
      points: json['points'] ?? 10,
      quizCount: json['questions_count'] ?? 6,
      isCompleted: json['is_completed'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'duration': duration,
      'title': title,
      'subtitle': subtitle,
      'description': description,
      'imageUrl': imageUrl,
      'skills': skills,
      'points': points,
    };
  }
}
