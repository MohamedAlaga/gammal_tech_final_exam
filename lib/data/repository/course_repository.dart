import 'package:dartz/dartz.dart';
import 'package:gammal_tech_final_exam/core/error/exceptions.dart';
import 'package:gammal_tech_final_exam/core/error/faliure.dart';
import 'package:gammal_tech_final_exam/data/remote_data_source/remote_course_data_source.dart';
import 'package:gammal_tech_final_exam/domain/entities/course.dart';
import 'package:gammal_tech_final_exam/domain/repository/base_course_repository.dart';

class CourseRepository extends BaseCourseRepository {
  final BaseRemoteCourseDataSource baseRemoteCourseDataSource;
  CourseRepository(this.baseRemoteCourseDataSource);

  @override
  Future<Either<Failure, List<Course>>> getAllCourses(String userToken) async {
    try {
      return right(await baseRemoteCourseDataSource.getAllCourses());
    } on ServerException catch (faliure) {
      return Left(ServerFailure(faliure.errorMessageModel.message));
    }
  }

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
