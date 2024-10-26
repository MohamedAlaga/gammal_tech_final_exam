/// this file contains all the environment variables that are used in the app
library;

import 'package:equatable/equatable.dart';

///class to handel answer
///[id] answer id
///[answer] answer text
///[isCorrect] answer correctness
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
