import 'dart:convert';

import 'package:gammal_tech_final_exam/core/error/error_message_model.dart';
import 'package:gammal_tech_final_exam/core/error/exceptions.dart';
import 'package:gammal_tech_final_exam/core/utils/env.dart';
import 'package:gammal_tech_final_exam/data/models/course_model.dart';
import 'package:gammal_tech_final_exam/domain/entities/course.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class BaseRemoteCourseDataSource {
  Future<List<Course>> getAllCourses();
  Future<List<Course>> getCoursesSuggetions(String userToken);
  Future<void> enrollUserToCourse(String courseId);
}

class RemoteCourseDataSource extends BaseRemoteCourseDataSource {
  @override
  Future<List<CourseModel>> getAllCourses() async {
    try {
      //https://exam.gammal.tech/API/courses/v2/1325
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var result = await http.get(Uri.parse(
          "${baseUrl}courses/v2/${prefs.getString("userId").toString()}"));
      if (result.statusCode == 200) {
        List<CourseModel> courses = [];
        for (var course in jsonDecode(result.body)) {
          courses.add(CourseModel.fromJson(course));
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
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var result = await http.get(Uri.parse(
          "${baseUrl}courses/v2/${prefs.getString("userId").toString()}"));
      if (result.statusCode == 200) {
        List<CourseModel> suggestedCourses = [];
        for (var course in jsonDecode(result.body)) {
          if (course["is_enrolled"] != true) {
            suggestedCourses.add(CourseModel.fromJson(course));
          }
        }
        return suggestedCourses;
      } else {
        throw ServerException(
            errorMessageModel: ErrorMessageModel(
                message: "error 1 accured getting Suggested courses",
                statusCode: result.statusCode,
                success: false));
      }
    } catch (e) {
      throw const ServerException(
          errorMessageModel: ErrorMessageModel(
              message: "error 2 accured getting Suggested courses",
              statusCode: 400,
              success: false));
    }
  }

  @override
  Future<void> enrollUserToCourse(String courseId) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await http.post(Uri.parse("${baseUrl}courses/enroll"),
          body: jsonEncode({
            "user_id": prefs.getString("userId").toString(),
            "course_id": courseId
          }),
          headers: {"Content-Type": "application/json"});
    } catch (e) {
      throw const ServerException(
          errorMessageModel: ErrorMessageModel(
              message: "error accured enrolling user to course",
              statusCode: 400,
              success: false));
    }
  }
}
