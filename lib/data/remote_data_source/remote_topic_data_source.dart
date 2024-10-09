import 'package:gammal_tech_final_exam/core/error/error_message_model.dart';
import 'package:gammal_tech_final_exam/core/error/exceptions.dart';
import 'package:gammal_tech_final_exam/data/models/topic_model.dart';
import 'package:gammal_tech_final_exam/core/utils/dummy.dart' as dummy;

abstract class BaseRemoteTopicDataSource {
  Future<List<TopicModel>> getCourseTopicsById(
      String courseId, String userToken);
  Future<List<TopicModel>> upNextTopics(String userToken);
}

class RemoteTopicDataSource extends BaseRemoteTopicDataSource {
  @override
  Future<List<TopicModel>> getCourseTopicsById(
      String courseId, String userToken) {
    try {
      return Future.delayed(const Duration(seconds: 1), () => dummy.allTopics);
    } catch (e) {
      throw const ServerException(
          errorMessageModel: ErrorMessageModel(
              message: "error accured getting all topics",
              statusCode: 404,
              success: false));
    }
  }

  @override
  Future<List<TopicModel>> upNextTopics(String userToken) {
    try {
      return Future.delayed(
          const Duration(seconds: 1), () => dummy.suggestedTopics);
    } catch (e) {
      throw const ServerException(
          errorMessageModel: ErrorMessageModel(
              message: "error accured getting up next  topics",
              statusCode: 404,
              success: false));
    }
  }
}
