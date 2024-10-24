/// The model class is used to convert the questions json data to the entity object and vice versa.
library;

import 'package:gammal_tech_final_exam/data/models/answer_model.dart';
import 'package:gammal_tech_final_exam/domain/entities/question.dart';

/// class to convert Questions json data to dart object and vice versa
class QuestionsModel extends Question{
  const QuestionsModel({
    required super.id,
    required super.question,
    required super.answers,
    required super.questionText,
  });
  /// convert json data to dart object
  factory QuestionsModel.fromJson(Map<String, dynamic> json) {
    return QuestionsModel(
      id: json['question_id'].toString(),
      question: json['code'],
      answers: (json['Choices'] as List)
          .map((answerJson) => AnswerModel.fromJson(answerJson))
          .toList(),
      questionText: json['question_text'],
    );
  }
  /// convert dart object to json data
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'question': question,
      'answers': answers,
    };
  }
}
