import 'package:dartz/dartz.dart';
import 'package:gammal_tech_final_exam/core/error/faliure.dart';
import 'package:gammal_tech_final_exam/domain/entities/user_rank.dart';

abstract class BaseUserRankRepository {
  Future<Either<Failure, List<UserRank>>> getUserRankings();
}
