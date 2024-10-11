import 'dart:convert';

import 'package:gammal_tech_final_exam/core/error/error_message_model.dart';
import 'package:gammal_tech_final_exam/core/error/exceptions.dart';
import 'package:gammal_tech_final_exam/core/utils/env.dart';
import 'package:gammal_tech_final_exam/data/models/course_model.dart';
import 'package:gammal_tech_final_exam/domain/entities/course.dart';
import 'package:gammal_tech_final_exam/core/utils/dummy.dart' as dummy;
import 'package:http/http.dart' as http;

abstract class BaseRemoteCourseDataSource {
  Future<List<Course>> getAllCourses(String userToken);
  Future<List<Course>> getCoursesSuggetions(String userToken);
  Future<void> enrollUserToCourse(String userId, String courseId);
}

class RemoteCourseDataSource extends BaseRemoteCourseDataSource {
  @override
  Future<List<CourseModel>> getAllCourses(String userToken) async {
    try {
      var result = await http.get(Uri.parse("${baseUrl}courses"));
      if (result.statusCode == 200) {
        List<CourseModel> courses = [];
        for (var course in jsonDecode(result.body)) {
          courses.add(CourseModel.fromJson(course));
          print(jsonDecode(result.body));
        }
        return courses;
      } else {
        throw ServerException(
            errorMessageModel: ErrorMessageModel(
                message: "error accured getting all courses",
                statusCode: result.statusCode,
                success: false));
      }
    } catch (e) {
      throw const ServerException(
          errorMessageModel: ErrorMessageModel(
              message: "error accured getting all courses",
              statusCode: 400,
              success: false));
    }
  }

  @override
  Future<List<CourseModel>> getCoursesSuggetions(String userToken) async {
    try {
      return Future.delayed(
          const Duration(seconds: 2), () => dummy.suggestedCourses);
    } catch (e) {
      throw const ServerException(
          errorMessageModel: ErrorMessageModel(
              message: "error accured getting suggested courses",
              statusCode: 404,
              success: false));
    }
  }

  @override
  Future<void> enrollUserToCourse(String userId, String courseId) async {
    try {
      var result = await http.post(Uri.parse("${baseUrl}courses/enroll"),
          body: {"userId": userId, "courseId": courseId});
      print(result.statusCode);
    } catch (e) {
      throw const ServerException(
          errorMessageModel: ErrorMessageModel(
              message: "error accured enrolling user to course",
              statusCode: 400,
              success: false));
    }
  }
}
