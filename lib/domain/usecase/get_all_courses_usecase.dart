import 'package:dartz/dartz.dart';
import 'package:gammal_tech_final_exam/core/error/faliure.dart';
import 'package:gammal_tech_final_exam/domain/entities/course.dart';
import 'package:gammal_tech_final_exam/domain/repository/base_course_repository.dart';

class GetAllCoursesUsecase {
  final BaseCourseRepository baseCourseRepository;
  GetAllCoursesUsecase(this.baseCourseRepository);

  Future<Either<Failure, List<Course>>> execute(String userId) async{
    return await baseCourseRepository.getAllCourses(userId);
  }
}