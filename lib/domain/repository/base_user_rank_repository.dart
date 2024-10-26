/// this file contains the abstract class [BaseUserRankRepository] that is used to define the methods that should be implemented in the data layer to get the user rank data from the server.
import 'package:dartz/dartz.dart';
import 'package:gammal_tech_final_exam/core/error/faliure.dart';
import 'package:gammal_tech_final_exam/domain/entities/user_rank.dart';

/// [BaseUserRankRepository] abstract class to define the methods that should be implemented in the data layer to get the user rank data from the server.
abstract class BaseUserRankRepository {
  Future<Either<Failure, List<UserRank>>> getUserRankings();
}
