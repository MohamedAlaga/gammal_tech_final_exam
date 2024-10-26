/// This file contains the usecase class for getting the questions of a topic
library;

import 'package:dartz/dartz.dart';
import 'package:gammal_tech_final_exam/core/error/faliure.dart';
import 'package:gammal_tech_final_exam/domain/entities/question.dart';
import 'package:gammal_tech_final_exam/domain/repository/base_topic_repository.dart';

/// [GetTopicQuestionsUsecase] class to get the questions of a topic
/// [baseTopicRepository] is the repository that is used to get the questions data from the server
/// [execute] method is used to get the questions of a topic
class GetTopicQuestionsUsecase {
  BaseTopicRepository baseTopicRepository;
  GetTopicQuestionsUsecase(this.baseTopicRepository);

  /// [execute] method is used to get the questions of a topic
  /// returns [Either] the result of the questions
  /// [Failure] if there is an error
  /// [List<Question>] if the questions are fetched successfully
  Future<Either<Failure, List<Question>>> execute(
      String topicId, int duration) async {
    return await baseTopicRepository.getTopicQuestions(topicId);
  }
}
