/// this file contains course entity class
library;

import 'package:equatable/equatable.dart';

///class to handel course data model
///[id] course id
///[name] course name
///[description] course description
///[imageUrl] course image url
///[quizzes] course quizzes number
///[rating] course rating
///[numberOfRatings] course number of ratings
///[progress] course progress
///[isEnrolled] course enrollment status
class Course extends Equatable {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final int quizzes;
  final double rating;
  final int numberOfRatings;
  final int progress;
  final bool isEnrolled;

  const Course({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.quizzes,
    required this.rating,
    required this.numberOfRatings,
    required this.progress,
    required this.isEnrolled ,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        imageUrl,
        quizzes,
        rating,
        numberOfRatings,
        progress,
        isEnrolled,
      ];
}
