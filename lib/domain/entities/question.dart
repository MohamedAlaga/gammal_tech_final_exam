/// This file contains the Question entity which is used to represent the question data in the application.
library;

import 'package:equatable/equatable.dart';
import 'package:gammal_tech_final_exam/data/models/answer_model.dart';

/// class to handel question
/// [id] question id
/// [question] question text
/// [answers] question answers
/// [questionText] question text
class Question extends Equatable {
  final String id;
  final String question;
  final List<AnswerModel> answers;
  final String questionText; 
  

  const Question({
    required this.id,
    required this.question,
    required this.answers,
    required this.questionText,
  });

  @override
  List<Object?> get props => [id, question, answers];
}
