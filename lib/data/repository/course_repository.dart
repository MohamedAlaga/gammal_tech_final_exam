/// This file contains the implementation of the [BaseCourseRepository] interface.
library;

import 'package:dartz/dartz.dart';
import 'package:gammal_tech_final_exam/core/error/exceptions.dart';
import 'package:gammal_tech_final_exam/core/error/faliure.dart';
import 'package:gammal_tech_final_exam/data/remote_data_source/remote_course_data_source.dart';
import 'package:gammal_tech_final_exam/domain/entities/course.dart';
import 'package:gammal_tech_final_exam/domain/repository/base_course_repository.dart';

/// CourseRepository class is responsible for handling all the remote data sources for the course entity.
class CourseRepository extends BaseCourseRepository {
  final BaseRemoteCourseDataSource baseRemoteCourseDataSource;
  CourseRepository(this.baseRemoteCourseDataSource);

  /// get all courses from the server
  /// on success : return list of courses
  /// on failure : throw ServerException contains the error message and code
  @override
  Future<Either<Failure, List<Course>>> getAllCourses(String userToken) async {
    try {
      return right(await baseRemoteCourseDataSource.getAllCourses());
    } on ServerException catch (faliure) {
      return Left(ServerFailure(faliure.errorMessageModel.message));
    }
  }

  /// get courses suggestions from the server
  /// on success : return list of courses
  /// on failure : throw ServerException contains the error message and code
  @override
  Future<Either<Failure, List<Course>>> getCoursesSuggetions(
      String userToken) async {
    try {
      return right(
          await baseRemoteCourseDataSource.getCoursesSuggetions(userToken));
    } on ServerException catch (faliure) {
      return Left(ServerFailure(faliure.errorMessageModel.message));
    }
  }

  /// enroll a user to a course
  /// on success : return void
  /// on failure : throw ServerException contains the error message and code
  @override
  Future<Either<Failure, void>> enrollUserToCourse(String courseId) async {
    try {
      return right(
          await baseRemoteCourseDataSource.enrollUserToCourse(courseId));
    } on ServerException catch (faliure) {
      return Left(ServerFailure(faliure.errorMessageModel.message));
    }
  }
}
