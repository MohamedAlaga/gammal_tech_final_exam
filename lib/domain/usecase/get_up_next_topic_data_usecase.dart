/// this file contains usecase to get up next topic data
library;

import 'package:dartz/dartz.dart';
import 'package:gammal_tech_final_exam/core/error/faliure.dart';
import 'package:gammal_tech_final_exam/domain/entities/topic.dart';
import 'package:gammal_tech_final_exam/domain/repository/base_topic_repository.dart';

/// [GetUpNextTopicDataUsecase] class to get up next topic data
/// [baseTopicRepository] is the repository that is used to get the up next topic data from the server
/// [execute] method is used to get up next topic data
class GetUpNextTopicDataUsecase {
  final BaseTopicRepository baseTopicRepository;
  GetUpNextTopicDataUsecase(this.baseTopicRepository);

  /// [execute] method is used to get up next topic data
  /// returns [Either] the result of the up next topic data
  /// [Failure] if there is an error
  /// [List<Topic>] if the up next topic data is fetched successfully
  Future<Either<Failure, List<Topic>>> execute() async{
    return await baseTopicRepository.upNextTopics();
  }
}