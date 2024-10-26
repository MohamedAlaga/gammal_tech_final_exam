/// This file contains the usecase for getting all courses
library;

import 'package:dartz/dartz.dart';
import 'package:gammal_tech_final_exam/core/error/faliure.dart';
import 'package:gammal_tech_final_exam/domain/entities/course.dart';
import 'package:gammal_tech_final_exam/domain/repository/base_course_repository.dart';

/// [GetAllCoursesUsecase] class to get all courses
/// [baseCourseRepository] is the repository that is used to get the courses data from the server
/// [execute] method is used to get all courses
class GetAllCoursesUsecase {
  final BaseCourseRepository baseCourseRepository;
  GetAllCoursesUsecase(this.baseCourseRepository);

  /// [execute] method is used to get all courses
  /// returns [Either] the result of the courses
  /// [Failure] if there is an error
  /// [List<Course>] if the courses are fetched successfully
  Future<Either<Failure, List<Course>>> execute(String userId) async{
    return await baseCourseRepository.getAllCourses(userId);
  }
}