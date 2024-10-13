import 'package:gammal_tech_final_exam/data/models/answer_model.dart';
import 'package:gammal_tech_final_exam/domain/entities/question.dart';

class QuestionsModel extends Question{
  const QuestionsModel({
    required super.id,
    required super.question,
    required super.answers,
    required super.questionText,
  });
  
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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'question': question,
      'answers': answers,
    };
  }
}
