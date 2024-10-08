import 'package:dartz/dartz.dart';
import 'package:gammal_tech_final_exam/core/error/faliure.dart';
import 'package:gammal_tech_final_exam/domain/entities/course.dart';

abstract class BaseCourseRepository {
  Future<Either<Failure, List<Course>>> getAllCourses();
  Future<Either<Failure, List<Course>>> getCoursesSuggetions();
}