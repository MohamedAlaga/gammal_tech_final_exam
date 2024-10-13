import 'package:equatable/equatable.dart';

class ExamsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchQuestionsEvent extends ExamsEvent {
  final String quizId;
  final int duration;

  FetchQuestionsEvent(this.quizId, this.duration);

  @override
  List<Object?> get props => [quizId];
}

class ExitQuizEvent extends ExamsEvent {}

class StartQuizEvent extends ExamsEvent {}

class NextQuestionEvent extends ExamsEvent {
  final int? answerId;
  final int questionId;
  NextQuestionEvent(
    this.questionId,
    this.answerId
  );
}

class SubmitAnswersEvent extends ExamsEvent {}
