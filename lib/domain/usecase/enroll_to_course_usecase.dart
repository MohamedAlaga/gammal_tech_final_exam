/// This usecase is responsible for enrolling the user to a course
library;
import 'package:dartz/dartz.dart';
import 'package:gammal_tech_final_exam/core/error/faliure.dart';
import 'package:gammal_tech_final_exam/domain/repository/base_course_repository.dart';

/// [EnrollToCourseUsecase] class to enroll the user to a course
/// [baseCourseRepository] is the repository that is used to get the courses data from the server
/// [execute] method is used to enroll the user to a course
class EnrollToCourseUsecase {
  final BaseCourseRepository baseCourseRepository;
  EnrollToCourseUsecase(this.baseCourseRepository);

  /// [execute] method is used to enroll the user to a course
  /// returns [Either] the result of the enrollment
  /// [Failure] if there is an error
  /// [void] if the user is enrolled successfully
  Future<Either<Failure, void>> execute( String courseId) async {
    return await baseCourseRepository.enrollUserToCourse(courseId);
  }
}
