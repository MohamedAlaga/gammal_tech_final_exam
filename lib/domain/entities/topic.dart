import 'package:equatable/equatable.dart';

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
