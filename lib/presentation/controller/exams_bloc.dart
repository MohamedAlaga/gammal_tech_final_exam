import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gammal_tech_final_exam/core/utils/enums.dart';
import 'package:gammal_tech_final_exam/domain/usecase/check_user_attempts_usecase.dart';
import 'package:gammal_tech_final_exam/domain/usecase/get_topic_questions_usecase.dart';
import 'package:gammal_tech_final_exam/domain/usecase/save_answer_usecase.dart';
import 'package:gammal_tech_final_exam/domain/usecase/subtract_user_attempt_usecase.dart';
import 'package:gammal_tech_final_exam/presentation/controller/exams_event.dart';
import 'package:gammal_tech_final_exam/presentation/controller/exams_state.dart';

class ExamsBloc extends Bloc<ExamsEvent, ExamsState> {
  final GetTopicQuestionsUsecase getTopicQuestionsUsecase;
  final SaveAnswerUsecase saveAnswerUsecase;
  final CheckUserAttemptsUsecase checkUserAttemptsUsecase;
  final SubtractUserAttemptUsecase subtractUserAttemptUsecase;
  ExamsBloc(this.getTopicQuestionsUsecase, this.saveAnswerUsecase,
      this.checkUserAttemptsUsecase, this.subtractUserAttemptUsecase)
      : super(const ExamsState()) {
    on<FetchQuestionsEvent>((event, emit) async {
      final result =
          await getTopicQuestionsUsecase.execute(event.quizId, event.duration);
      result.fold(
          (l) => emit(state.copyWith(
              questionsRequestState: RequestState.error,
              questionsErrorMessage: l.message)),
          (r) => emit(state.copyWith(
                questionsRequestState: RequestState.loaded,
                questions: r,
                duration: event.duration,
                quizId: event.quizId,
                isStarted: false,
              )));
    });
    on<NextQuestionEvent>((event, emit) {
      final newSelectedAnswers = Map<int, int?>.from(state.selectedAnswers);
      newSelectedAnswers[event.questionId] = event.answerId;

      if (state.currentQuestionIndex == state.questions.length - 1) {
        emit(state.copyWith(selectedAnswers: newSelectedAnswers));
      } else {
        emit(state.copyWith(
            currentQuestionIndex: state.currentQuestionIndex + 1,
            selectedAnswers: newSelectedAnswers));
      }
    });
    on<StartQuizEvent>(
      (event, emit) {
        subtractUserAttemptUsecase.execute();
        emit(state.copyWith(
            isStarted: true, selectedAnswers: {}, currentQuestionIndex: 0));
      },
    );
    on<SubmitAnswersEvent>((event, emit) async {
      final result =
          await saveAnswerUsecase.execute(state.quizId, state.selectedAnswers);
      result.fold(
          (l) => emit(state.copyWith(
              saveAnswerRequestState: RequestState.error,
              saveAnswerErrorMessage: l.message)), (r) {
        emit(state.copyWith(
            saveAnswerRequestState: RequestState.loaded, result: r));
      });
    });
    on<ExitQuizEvent>((event, emit) {
      emit(ExamsState(
          quizId: state.quizId,
          duration: state.duration,
          currentQuestionIndex: 0));
    });
  }
}
