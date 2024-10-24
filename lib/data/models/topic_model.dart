/// The model class is used to convert the Topic json data to the entity object and vice versa.
library;

import 'package:gammal_tech_final_exam/core/utils/env.dart';
import 'package:gammal_tech_final_exam/domain/entities/topic.dart';

/// class to convert Topic json data to dart object and vice versa
class TopicModel extends Topic {
  const TopicModel({
    required super.id,
    required super.courseId,
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
  /// convert json data to dart object
  factory TopicModel.fromJson(Map<String, dynamic> json) {
    int id = json['quiz_id']??json['id'];
    int courseId = json['course_id']??1;
    return TopicModel(
      id: id.toString(),
      courseId: courseId.toString(),
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
  /// convert dart object to json data
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
