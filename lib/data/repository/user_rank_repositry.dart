/// This file contains the implementation of the [BaseUserRankRepository] interface.
/// This class is responsible for handling all the remote data sources for the user rank entity.
library;

import 'package:dartz/dartz.dart';
import 'package:gammal_tech_final_exam/core/error/exceptions.dart';
import 'package:gammal_tech_final_exam/core/error/faliure.dart';
import 'package:gammal_tech_final_exam/data/remote_data_source/remote_user_rank_data_source.dart';
import 'package:gammal_tech_final_exam/domain/entities/user_rank.dart';

import '../../domain/repository/base_user_rank_repository.dart';

/// UserRankRepository class is responsible for handling all the remote data sources for the user rank entity.
/// This class extends the [BaseUserRankRepository] class.
class UserRankRepository extends BaseUserRankRepository {
  final BaseRemoteUserRankDataSource baseRemoteUserRankDataSource;
  UserRankRepository(this.baseRemoteUserRankDataSource);

  /// get user rankings from the server
  /// on success : return list of user rankings
  /// on failure : throw ServerException contains the error message and code
  @override
  Future<Either<Failure, List<UserRank>>> getUserRankings() async {
    try {
      return right(await baseRemoteUserRankDataSource.getUserRankings());
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }
}
