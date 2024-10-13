import 'package:dartz/dartz.dart';
import 'package:gammal_tech_final_exam/core/error/faliure.dart';
import 'package:gammal_tech_final_exam/domain/repository/base_topic_repository.dart';

class SaveAnswerUsecase {
  final BaseTopicRepository baseTopicRepository;
  SaveAnswerUsecase(this.baseTopicRepository);

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
