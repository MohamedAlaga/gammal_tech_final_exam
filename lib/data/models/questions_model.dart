import 'package:gammal_tech_final_exam/domain/entities/question.dart';

class QuestionsModel extends Question{
  const QuestionsModel({
    required super.id,
    required super.question,
    required super.answers,
  });

  factory QuestionsModel.fromJson(Map<String, dynamic> json) {
    return QuestionsModel(
      id: json['id'],
      question: json['question'],
      answers: json['answers'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'question': question,
      'answers': answers,
    };
  }
}
