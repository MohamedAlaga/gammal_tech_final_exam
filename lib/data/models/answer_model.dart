import 'package:gammal_tech_final_exam/domain/entities/answer.dart';

class AnswerModel extends Answer {
  const AnswerModel({
    required super.id,
    required super.answer,
    required super.isCorrect,
  });

  factory AnswerModel.fromJson(Map<String, dynamic> json) {
    return AnswerModel(
      id: json['choice_id'].toString(),
      answer: json['choice_text'],
      isCorrect: json['is_correct'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'answer': answer,
      'isCorrect': isCorrect,
    };
  }
}
