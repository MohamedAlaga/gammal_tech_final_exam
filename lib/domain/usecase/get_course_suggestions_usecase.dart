/// This file contains the usecase for getting course suggestions
library;

import 'package:dartz/dartz.dart';
import 'package:gammal_tech_final_exam/core/error/faliure.dart';
import 'package:gammal_tech_final_exam/domain/entities/course.dart';
import 'package:gammal_tech_final_exam/domain/repository/base_course_repository.dart';

/// [GetCourseSuggestionsUsecase] class to get course suggestions
/// [baseCourseRepository] is the repository that is used to get the course suggestions data from the server
/// [execute] method is used to get course suggestions
class GetCourseSuggestionsUsecase {
  final BaseCourseRepository baseCourseRepository;
  GetCourseSuggestionsUsecase(this.baseCourseRepository);
  /// [execute] method is used to get course suggestions
  /// returns [Either] the result of the course suggestions
  /// [Failure] if there is an error
  /// [List<Course>] if the course suggestions are fetched successfully
  Future<Either<Failure, List<Course>>> execute(String userToken) async {
    return await baseCourseRepository.getCoursesSuggetions(userToken);
  }
}
