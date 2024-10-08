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
      id: json['id'],
      name: json['name'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      quizzes: json['quizzes'],
      rating: json['rating'],
      numberOfRatings: json['numberOfRatings'],
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