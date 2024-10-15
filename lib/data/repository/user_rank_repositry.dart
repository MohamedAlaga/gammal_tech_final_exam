import 'package:dartz/dartz.dart';
import 'package:gammal_tech_final_exam/core/error/exceptions.dart';
import 'package:gammal_tech_final_exam/core/error/faliure.dart';
import 'package:gammal_tech_final_exam/data/remote_data_source/remote_user_rank_data_source.dart';
import 'package:gammal_tech_final_exam/domain/entities/user_rank.dart';

import '../../domain/repository/base_user_rank_repository.dart';

class UserRankRepository extends BaseUserRankRepository {
  final BaseRemoteUserRankDataSource baseRemoteUserRankDataSource;
  UserRankRepository(this.baseRemoteUserRankDataSource);

  @override
  Future<Either<Failure, List<UserRank>>> getUserRankings() async {
    try {
      return right(await baseRemoteUserRankDataSource.getUserRankings());
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }
}
