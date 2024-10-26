/// Topic entity class
import 'package:equatable/equatable.dart';

/// class to handel topic data model
/// [id] topic id
/// [courseId] course id
/// [duration] topic duration
/// [title] topic title
/// [subtitle] topic subtitle
/// [description] topic description
/// [imageUrl] topic image url
/// [skills] topic skills
/// [points] topic points
/// [quizCount] topic quiz count
/// [isCompleted] topic completion status
class Topic extends Equatable {
  final String id;
  final String courseId;
  final int duration;
  final String title;
  final String subtitle;
  final String description;
  final String imageUrl;
  final String skills;
  final int points;
  final int quizCount;
  final bool isCompleted;

  const Topic({
    required this.id,
    required this.courseId,
    required this.duration,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.imageUrl,
    required this.skills,
    required this.points,
    required this.quizCount,
    required this.isCompleted,
  });

  @override
  List<Object?> get props => [
        id,
        courseId,
        duration,
        title,
        subtitle,
        description,
        imageUrl,
        skills,
        points,
        quizCount,
        isCompleted,
      ]; 
}
