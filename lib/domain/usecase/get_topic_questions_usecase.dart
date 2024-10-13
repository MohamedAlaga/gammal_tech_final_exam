import 'package:dartz/dartz.dart';
import 'package:gammal_tech_final_exam/core/error/faliure.dart';
import 'package:gammal_tech_final_exam/domain/entities/question.dart';
import 'package:gammal_tech_final_exam/domain/repository/base_topic_repository.dart';

class GetTopicQuestionsUsecase {
  BaseTopicRepository baseTopicRepository;
  GetTopicQuestionsUsecase(this.baseTopicRepository);
  Future<Either<Failure,List<Question>>> execute(String topicId , int duration) async{
    return await baseTopicRepository.getTopicQuestions(topicId);
  }
}