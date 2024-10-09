import 'package:dartz/dartz.dart';
import 'package:gammal_tech_final_exam/core/error/exceptions.dart';
import 'package:gammal_tech_final_exam/core/error/faliure.dart';
import 'package:gammal_tech_final_exam/data/remote_data_source/remote_topic_data_source.dart';
import 'package:gammal_tech_final_exam/domain/entities/topic.dart';
import 'package:gammal_tech_final_exam/domain/repository/base_topic_repository.dart';

class TopicRepository extends BaseTopicRepository {
  final BaseRemoteTopicDataSource baseRemoteTopicDataSource;
  TopicRepository(this.baseRemoteTopicDataSource);
  @override
  Future<Either<Failure, List<Topic>>> getCourseTopicsById(String courseId, String userToken) async{
    try {
      return right(await baseRemoteTopicDataSource.getCourseTopicsById(courseId, userToken));
    }
    on ServerException catch (faliure) {
      return left(ServerFailure(faliure.errorMessageModel.message));
    }
  }
  @override
  Future<Either<Failure, List<Topic>>> upNextTopics(String userToken) async{
    try {
      return right(await baseRemoteTopicDataSource.upNextTopics(userToken));
    }
    on ServerException catch (faliure) {
      return left(ServerFailure(faliure.errorMessageModel.message));
    }
  }
}
