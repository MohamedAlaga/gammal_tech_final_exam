import 'package:gammal_tech_final_exam/core/error/error_message_model.dart';
import 'package:gammal_tech_final_exam/core/error/exceptions.dart';
import 'package:gammal_tech_final_exam/data/models/course_model.dart';
import 'package:gammal_tech_final_exam/domain/entities/course.dart';
import 'package:gammal_tech_final_exam/core/utils/dummy.dart' as dummy;

abstract class BaseRemoteCourseDataSource {
  Future<List<Course>> getAllCourses();
  Future<List<Course>> getCoursesSuggetions();
}

class RemoteCourseDataSource extends BaseRemoteCourseDataSource {
  @override
  Future<List<CourseModel>> getAllCourses() async {
    try {
      return Future.delayed(const Duration(seconds: 2), () => dummy.allCourses);
    } catch (e) {
      throw const ServerException(
          errorMessageModel: ErrorMessageModel(
              message: "error accured getting all courses",
              statusCode: 404,
              success: false));
    }
  }

  Future<List<CourseModel>> getCoursesSuggetions() async {
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
}
