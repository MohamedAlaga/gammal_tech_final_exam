import 'package:equatable/equatable.dart';

class Answer extends Equatable {
  final String id;
  final String answer;
  final bool isCorrect;

  const Answer({
    required this.id,
    required this.answer,
    required this.isCorrect,
  });

  @override
  List<Object?> get props => [id, answer, isCorrect];
}
