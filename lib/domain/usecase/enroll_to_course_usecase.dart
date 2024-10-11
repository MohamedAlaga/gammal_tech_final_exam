import 'package:dartz/dartz.dart';
import 'package:gammal_tech_final_exam/core/error/faliure.dart';
import 'package:gammal_tech_final_exam/domain/repository/base_course_repository.dart';

class EnrollToCourseUsecase {
  final BaseCourseRepository baseCourseRepository;
  EnrollToCourseUsecase(this.baseCourseRepository);

  Future<Either<Failure, void>> execute(String userId, String courseId) async {
    return await baseCourseRepository.enrollUserToCourse(userId, courseId);
  }
}
