/// This file contains the abstract class [BaseCourseRepository] that is used to define the methods that should be implemented in the data layer to get the courses data from the server.
library;

import 'package:dartz/dartz.dart';
import 'package:gammal_tech_final_exam/core/error/faliure.dart';
import 'package:gammal_tech_final_exam/domain/entities/course.dart';

/// [BaseCourseRepository] abstract class to define the methods that should be implemented in the data layer to get the courses data from the server.
abstract class BaseCourseRepository {
  Future<Either<Failure, List<Course>>> getAllCourses(String userToken);
  Future<Either<Failure, List<Course>>> getCoursesSuggetions(String userToken);
  Future<Either<Failure, void>> enrollUserToCourse(String courseId );
}
