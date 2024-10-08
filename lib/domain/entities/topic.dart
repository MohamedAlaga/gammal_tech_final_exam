import 'package:equatable/equatable.dart';
import 'package:gammal_tech_final_exam/data/models/questions_model.dart';

class Topic extends Equatable {
  final String id;
  final int duration;
  final String title;
  final String subtitle;
  final String description;
  final String imageUrl;
  final List<QuestionsModel> questions;
  final String skills;
  final int points;

  const Topic({
    required this.id,
    required this.duration,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.imageUrl,
    required this.questions,
    required this.skills,
    required this.points,
  });

  @override
  List<Object?> get props => [
        id,
        duration,
        title,
        subtitle,
        description,
        imageUrl,
        questions,
        skills,
        points,
      ]; 
}
