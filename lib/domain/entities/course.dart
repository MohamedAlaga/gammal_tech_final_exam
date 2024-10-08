import 'package:equatable/equatable.dart';

class Course extends Equatable {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final int quizzes;
  final double rating;
  final int numberOfRatings;

  const Course({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.quizzes,
    required this.rating,
    required this.numberOfRatings,
  });

  @override
  List<Object?> get props =>
      [id, name, description, imageUrl, quizzes, rating, numberOfRatings];
}
