/// this file is responsible for converting AnswerModel to json data to dart object and vice versa
/// [AnswerModel] class to convert json data to dart object
/// [AnswerModel.fromJson] method to convert json data to dart object
/// [AnswerModel.toJson] method to convert dart object to json data
library;

import 'package:gammal_tech_final_exam/domain/entities/answer.dart';

/// AnswerModel class to convert json data to dart object
/// [id] answer id
/// [answer] answer text
/// [isCorrect] answer correctness
class AnswerModel extends Answer {
  const AnswerModel({
    required super.id,
    required super.answer,
    required super.isCorrect,
  });

/// convert json data to dart object
  factory AnswerModel.fromJson(Map<String, dynamic> json) {
    return AnswerModel(
      id: json['choice_id'].toString(),
      answer: json['choice_text'],
      isCorrect: json['is_correct'],
    );
  }
/// convert dart object to json data
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'answer': answer,
      'isCorrect': isCorrect,
    };
  }
}
