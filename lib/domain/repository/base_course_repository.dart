import 'package:dartz/dartz.dart';
import 'package:gammal_tech_final_exam/core/error/faliure.dart';
import 'package:gammal_tech_final_exam/domain/entities/course.dart';

abstract class BaseCourseRepository {
  Future<Either<Failure, List<Course>>> getAllCourses(String userToken);
  Future<Either<Failure, List<Course>>> getCoursesSuggetions(String userToken);
  Future<Either<Failure, void>> enrollUserToCourse(String courseId );
}
