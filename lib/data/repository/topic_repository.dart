/// This file contains the implementation of the [BaseTopicRepository] interface.
/// This class is responsible for handling all the remote data sources for the topic entity.
library;

import 'package:dartz/dartz.dart';
import 'package:gammal_tech_final_exam/core/error/exceptions.dart';
import 'package:gammal_tech_final_exam/core/error/faliure.dart';
import 'package:gammal_tech_final_exam/data/remote_data_source/remote_topic_data_source.dart';
import 'package:gammal_tech_final_exam/domain/entities/question.dart';
import 'package:gammal_tech_final_exam/domain/entities/topic.dart';
import 'package:gammal_tech_final_exam/domain/repository/base_topic_repository.dart';

/// TopicRepository class is responsible for handling all the remote data sources for the topic entity.
class TopicRepository extends BaseTopicRepository {
  final BaseRemoteTopicDataSource baseRemoteTopicDataSource;
  TopicRepository(this.baseRemoteTopicDataSource);
  /// get all topics from the server
  /// on success : return list of topics
  /// on failure : throw ServerException contains the error message and code
  @override
  Future<Either<Failure, List<Topic>>> getCourseTopicsById(
      String courseId) async {
    try {
      return right(
          await baseRemoteTopicDataSource.getCourseTopicsById(courseId));
    } on ServerException catch (faliure) {
      return left(ServerFailure(faliure.errorMessageModel.message));
    }
  }
  /// get up next topics from the server
  /// on success : return list of topics
  /// on failure : throw ServerException contains the error message and code
  @override
  Future<Either<Failure, List<Topic>>> upNextTopics() async {
    try {
      return right(await baseRemoteTopicDataSource.upNextTopics());
    } on ServerException catch (faliure) {
      return left(ServerFailure(faliure.errorMessageModel.message));
    }
  }

  /// save user answer to the server
  /// on success : return double
  /// on failure : throw ServerException contains the error message and code
  @override
  Future<Either<Failure, double>> saveUserAnswer(
      String topicId, Map<int, int?> userAnswer) async {
    try {
      return right(
          await baseRemoteTopicDataSource.saveAnswer(topicId, userAnswer));
    } on ServerException catch (faliure) {
      return left(ServerFailure(faliure.errorMessageModel.message));
    }
  }

  /// get topic questions from the server
  /// on success : return list of questions
  /// on failure : throw ServerException contains the error message and code
  @override
  Future<Either<Failure, List<Question>>> getTopicQuestions(
      String topicId) async {
    try {
      return right(await baseRemoteTopicDataSource.getTopicQuestions(topicId));
    } on ServerException catch (faliure) {
      return left(ServerFailure(faliure.errorMessageModel.message));
    }
  }
}
