/// this file contains the usecase to get course topics by id
library;
import 'package:dartz/dartz.dart';
import 'package:gammal_tech_final_exam/core/error/faliure.dart';
import 'package:gammal_tech_final_exam/domain/entities/topic.dart';
import 'package:gammal_tech_final_exam/domain/repository/base_topic_repository.dart';

/// [GetCourseTopicsByIdUsecase] class to get course topics by id
/// [baseTopicRepository] is the repository that is used to get the course topics data from the server
/// [execute] method is used to get course topics by id 
class GetCourseTopicsByIdUsecase {
  BaseTopicRepository baseTopicRepository;
  GetCourseTopicsByIdUsecase(this.baseTopicRepository);

  /// [execute] method is used to get course topics by id
  /// returns [Either] the result of the course topics
  /// [Failure] if there is an error
  /// [List<Topic>] if the course topics are fetched successfully
  Future<Either<Failure, List<Topic>>> execute(String topicId) async {
    return await baseTopicRepository.getCourseTopicsById(topicId);
  }
}
