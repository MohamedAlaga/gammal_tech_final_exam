import 'package:dartz/dartz.dart';
import 'package:gammal_tech_final_exam/core/error/faliure.dart';
import 'package:gammal_tech_final_exam/domain/entities/question.dart';
import 'package:gammal_tech_final_exam/domain/entities/topic.dart';

abstract class BaseTopicRepository {
  Future<Either<Failure, List<Topic>>> getCourseTopicsById(String courseId);
  Future<Either<Failure, List<Topic>>> upNextTopics();
  Future<Either<Failure, double>> saveUserAnswer(
      String topicId, Map<int, int?> userAnswer);
  Future<Either<Failure, List<Question>>> getTopicQuestions(String topicId);
}
