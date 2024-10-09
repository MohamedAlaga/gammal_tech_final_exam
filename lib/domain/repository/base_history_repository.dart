import 'package:dartz/dartz.dart';
import 'package:gammal_tech_final_exam/core/error/faliure.dart';
import 'package:gammal_tech_final_exam/domain/entities/user_log.dart';

abstract class BaseHistoryRepository {
  Future<Either<Failure, List<UserLog>>> getHistory(String userToken); 
}
