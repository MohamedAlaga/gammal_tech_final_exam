/// this file contains the abstract class [BaseTopicRepository] that is used to define the methods that should be implemented in the data layer to get the topics data from the server.
library;

import 'package:dartz/dartz.dart';
import 'package:gammal_tech_final_exam/core/error/faliure.dart';
import 'package:gammal_tech_final_exam/domain/entities/question.dart';
import 'package:gammal_tech_final_exam/domain/entities/topic.dart';

/// [BaseTopicRepository] abstract class to define the methods that should be implemented in the data layer to get the topics data from the server.
abstract class BaseTopicRepository {
  Future<Either<Failure, List<Topic>>> getCourseTopicsById(String courseId);
  Future<Either<Failure, List<Topic>>> upNextTopics();
  Future<Either<Failure, double>> saveUserAnswer(
      String topicId, Map<int, int?> userAnswer);
  Future<Either<Failure, List<Question>>> getTopicQuestions(String topicId);
}
