import 'package:dartz/dartz.dart';
import 'package:gammal_tech_final_exam/core/error/faliure.dart';
import 'package:gammal_tech_final_exam/domain/entities/topic.dart';
import 'package:gammal_tech_final_exam/domain/repository/base_topic_repository.dart';

class GetUpNextTopicDataUsecase {
  final BaseTopicRepository baseTopicRepository;
  GetUpNextTopicDataUsecase(this.baseTopicRepository);

  Future<Either<Failure, List<Topic>>> execute() async{
    return await baseTopicRepository.upNextTopics();
  }
}