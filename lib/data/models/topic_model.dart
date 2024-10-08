import 'package:gammal_tech_final_exam/domain/entities/topic.dart';

class TopicModel extends Topic {
  const TopicModel({
    required super.id,
    required super.duration,
    required super.title,
    required super.subtitle,
    required super.description,
    required super.imageUrl,
    required super.questions,
    required super.skills,
    required super.points,
  });

  factory TopicModel.fromJson(Map<String, dynamic> json) {
    return TopicModel(
      id: json['id'],
      duration: json['duration'],
      title: json['title'],
      subtitle: json['subtitle'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      questions: json['questions'],
      skills: json['skills'],
      points: json['points'],
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
      'questions': questions,
      'skills': skills,
      'points': points,
    };
  }
}
