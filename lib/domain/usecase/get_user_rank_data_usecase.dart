/// This file contains the usecase class for getting user rank data from the repository.
library;

import 'package:dartz/dartz.dart';
import 'package:gammal_tech_final_exam/domain/entities/user_rank.dart';
import 'package:gammal_tech_final_exam/domain/repository/base_user_rank_repository.dart';
import 'package:gammal_tech_final_exam/core/error/faliure.dart';

/// [GetUserRankUsecase] class to get user rank data
/// [baseUserRankRepository] is the repository that is used to get the user rank data from the server
/// [execute] method is used to get the user rank data
class GetUserRankUsecase {
  final BaseUserRankRepository baseUserRankRepository;

  GetUserRankUsecase(this.baseUserRankRepository);

  /// [execute] method is used to get the user rank data
  /// returns [Either] the result of the user rank data
  /// [Failure] if there is an error
  /// [List<UserRank>] if the user rank data is fetched successfully
  Future<Either<Failure, List<UserRank>>> execute() async {
    return await baseUserRankRepository.getUserRankings();
  }
}
