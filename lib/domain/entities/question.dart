import 'package:equatable/equatable.dart';
import 'package:gammal_tech_final_exam/data/models/answer_model.dart';

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
