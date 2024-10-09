import 'package:dartz/dartz.dart';
import 'package:gammal_tech_final_exam/core/error/faliure.dart';
import 'package:gammal_tech_final_exam/domain/entities/topic.dart';

abstract class BaseTopicRepository {
  Future<Either<Failure, List<Topic>>> getCourseTopicsById(String courseId, String userToken);
  Future<Either<Failure, List<Topic>>> upNextTopics(String userToken);
}