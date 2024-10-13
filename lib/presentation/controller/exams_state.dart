import 'package:equatable/equatable.dart';
import 'package:gammal_tech_final_exam/core/utils/enums.dart';
import 'package:gammal_tech_final_exam/domain/entities/question.dart';

class ExamsState extends Equatable {
  final String quizId;
  final List<Question> questions;
  final RequestState questionsRequestState;
  final String questionsErrorMessage;
  final int currentQuestionIndex;
  final bool isStarted;
  final int duration;
  final Map<int, int?> selectedAnswers;
  final double? result;
  final RequestState saveAnswerRequestState;
  final String saveAnswerErrorMessage;

  const ExamsState({
    this.quizId = "0",
    this.questions = const [],
    this.questionsRequestState = RequestState.loading,
    this.questionsErrorMessage = "",
    this.currentQuestionIndex = 0,
    this.isStarted = false,
    this.duration = 10,
    this.selectedAnswers = const {},
    this.result,
    this.saveAnswerRequestState = RequestState.loading,
    this.saveAnswerErrorMessage = "",
  });

  ExamsState copyWith({
    String? quizId,
    List<Question>? questions,
    RequestState? questionsRequestState,
    String? questionsErrorMessage,
    int? currentQuestionIndex,
    bool? isStarted,
    int? duration,
    Map<int, int?>? selectedAnswers,
    double? result,
    RequestState? saveAnswerRequestState,
    String? saveAnswerErrorMessage,
  }) {
    return ExamsState(
      quizId: quizId ?? this.quizId,
      questions: questions ?? this.questions,
      questionsRequestState:
          questionsRequestState ?? this.questionsRequestState,
      questionsErrorMessage:
          questionsErrorMessage ?? this.questionsErrorMessage,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      isStarted: isStarted ?? this.isStarted,
      duration: duration ?? this.duration,
      selectedAnswers: selectedAnswers ?? this.selectedAnswers,
      result: result ?? this.result,
      saveAnswerRequestState:
          saveAnswerRequestState ?? this.saveAnswerRequestState,
      saveAnswerErrorMessage:
          saveAnswerErrorMessage ?? this.saveAnswerErrorMessage,
    );
  }

  @override
  List<Object?> get props => [
        quizId,
        questions,
        questionsRequestState,
        questionsErrorMessage,
        currentQuestionIndex,
        isStarted,
        duration,
        selectedAnswers,
        result,
        saveAnswerRequestState,
        saveAnswerErrorMessage,
      ];
}
