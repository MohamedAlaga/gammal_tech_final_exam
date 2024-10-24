/// This file contains the remote data source for the user history.
library;

import 'dart:convert';
import 'package:gammal_tech_final_exam/core/error/error_message_model.dart';
import 'package:gammal_tech_final_exam/core/error/exceptions.dart';
import 'package:gammal_tech_final_exam/core/utils/env.dart';
import 'package:gammal_tech_final_exam/data/models/questions_model.dart';
import 'package:gammal_tech_final_exam/data/models/topic_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

/// base class for the remote topic data source
abstract class BaseRemoteTopicDataSource {
  Future<List<TopicModel>> getCourseTopicsById(
    String courseId,
  );
  Future<List<TopicModel>> upNextTopics();
  Future<double> saveAnswer(String topicId, Map<int, int?> userAnswer);
  Future<List<QuestionsModel>> getTopicQuestions(String topicId);
}

/// RemoteTopicDataSource class is responsible for handling all the remote data sources for the topic entity.
class RemoteTopicDataSource extends BaseRemoteTopicDataSource {
  /// get course topics by course id from the server
  /// on success : return list of topics
  /// on failure : throw ServerException contains the error message and code
  @override
  Future<List<TopicModel>> getCourseTopicsById(String courseId) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var result = await http.get(Uri.parse(
          "${baseUrl}quizzes/${prefs.getString("userId").toString()}/$courseId"));
      if (result.statusCode == 200) {
        List<TopicModel> topics = [];
        for (var topic in jsonDecode(result.body)) {
          topics.add(TopicModel.fromJson(topic));
        }
        return topics;
      } else {
        throw ServerException(
            errorMessageModel: ErrorMessageModel(
                message: "error accured getting course topics",
                statusCode: result.statusCode,
                success: false));
      }
    } catch (e) {
      throw const ServerException(
          errorMessageModel: ErrorMessageModel(
              message: "error accured getting all topics",
              statusCode: 404,
              success: false));
    }
  }

  /// get up next topics from the server
  /// on success : return list of topics
  /// on failure : throw ServerException contains the error message and code
  @override
  Future<List<TopicModel>> upNextTopics() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<TopicModel> suggestedTopics = [];
      var result = await http.get(Uri.parse(
          "${baseUrl}courses/${prefs.getString("userId").toString()}/next-quizzes/"));
      if (result.statusCode == 200) {
        for (var topic in jsonDecode(result.body)) {
          suggestedTopics.add(TopicModel.fromJson(topic));
        }
        return suggestedTopics;
      } else {
        return [];
      }
    } catch (e) {
      throw const ServerException(
          errorMessageModel: ErrorMessageModel(
              message: "error 2 accured getting up next topics",
              statusCode: 404,
              success: false));
    }
  }

  /// save user answer to the server
  /// on success : return the score
  /// on failure : throw ServerException contains the error message and code
  @override
  Future<double> saveAnswer(String topicId, Map<int, int?> userAnswer) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<Map<String, int?>> answerList =
          userAnswer.entries.where((entry) => entry.value != null).map((entry) {
        return {
          "question_id": entry.value,
          "chosen_choice_id": entry.key,
        };
      }).toList();
      var result = await http.post(Uri.parse("${baseUrl}quiz/submit"),
          body: jsonEncode({
            "user_id": int.parse(prefs.getString("userId").toString()),
            "quiz_id": int.parse(topicId),
            "answers": answerList
          }),
          headers: {
            "Content-Type": "application/json",
          });
      if (result.statusCode == 200) {
        return (jsonDecode(result.body)["score"] / userAnswer.length)*100;
      } else {
        throw ServerException(
            errorMessageModel: ErrorMessageModel(
                message: "error accured saving answer",
                statusCode: result.statusCode,
                success: false));
      }
    } catch (e) {
      throw const ServerException(
          errorMessageModel: ErrorMessageModel(
              message: "error accured saving answer",
              statusCode: 404,
              success: false));
    }
  }

  /// get topic questions from the server
  /// on success : return list of questions
  /// on failure : throw ServerException contains the error message and code
  @override
  Future<List<QuestionsModel>> getTopicQuestions(String topicId) async {
    try {
      var result = await http.get(Uri.parse("${baseUrl}quiz/$topicId"));
      if (result.statusCode == 200) {
        List<QuestionsModel> questions = [];
        for (var question in jsonDecode(result.body)) {
          questions.add(QuestionsModel.fromJson(question));
        }
        return questions;
      } else {
        throw ServerException(
            errorMessageModel: ErrorMessageModel(
                message: "error accured getting topic questions",
                statusCode: result.statusCode,
                success: false));
      }
    } catch (e) {
      throw const ServerException(
          errorMessageModel: ErrorMessageModel(
              message: "error accured getting topic questions",
              statusCode: 404,
              success: false));
    }
  }
}
