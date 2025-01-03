/// The model class is used to convert the courses json data to the entity object and vice versa.
library;

import 'package:gammal_tech_final_exam/core/utils/env.dart';
import 'package:gammal_tech_final_exam/domain/entities/course.dart';

/// class to convert Course json data to dart object and vice versa
class CourseModel extends Course {
  const CourseModel({
    required super.id,
    required super.name,
    required super.description,
    required super.imageUrl,
    required super.quizzes,
    required super.rating,
    required super.numberOfRatings,
    required super.progress,
    required super.isEnrolled,
  });

  /// convert json data to dart object
  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id: json['id'].toString(),
      name: json['name'],
      description: json['description'],
      imageUrl: json['image_url'] ?? courseImageUrl,
      quizzes: json['total_quizzes'] ?? 0,
      rating: json['rating'] ?? 0.0,
      numberOfRatings: json['number_of_rates'] ?? 0,
      progress: json['finished_quizzes'],
      isEnrolled: json['is_enrolled'],
    );
  }

  /// convert dart object to json data
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
      'quizzes': quizzes,
      'rating': rating,
      'numberOfRatings': numberOfRatings,
      'progress': progress,
      'isEnrolled': isEnrolled,
    };
  }
}
