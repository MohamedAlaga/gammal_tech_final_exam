import 'package:gammal_tech_final_exam/core/utils/env.dart';
import 'package:gammal_tech_final_exam/domain/entities/course.dart';

class CourseModel extends Course {
  const CourseModel({
    required super.id,
    required super.name,
    required super.description,
    required super.imageUrl,
    required super.quizzes,
    required super.rating,
    required super.numberOfRatings,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id: json['course_id'].toString(),
      name: json['course_name'],
      description: json['description'],
      imageUrl: courseImageUrl,
      quizzes: json['total_quizzes'],
      rating: 4,
      numberOfRatings: 15,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
      'quizzes': quizzes,
      'rating': rating,
      'numberOfRatings': numberOfRatings,
    };
  }
}