/// This usecase is responsible for saving the user answer to the database.
library;

import 'package:dartz/dartz.dart';
import 'package:gammal_tech_final_exam/core/error/faliure.dart';
import 'package:gammal_tech_final_exam/domain/repository/base_topic_repository.dart';

/// [SaveAnswerUsecase] class to save the user answer
/// [baseTopicRepository] is the repository that is used to save the user answer
/// [execute] method is used to save the user answer
class SaveAnswerUsecase {
  final BaseTopicRepository baseTopicRepository;
  SaveAnswerUsecase(this.baseTopicRepository);

  /// [execute] method is used to save the user answer
  /// returns [Either] the result of the user answer
  /// [Failure] if there is an error
  /// [double] if the user answer is saved successfully
  Future<Either<Failure, double>> execute(
    String topicId,
    Map<int, int?> userAnswer,
  ) async {
    return await baseTopicRepository.saveUserAnswer(
      topicId,
      userAnswer,
    );
  }
}
