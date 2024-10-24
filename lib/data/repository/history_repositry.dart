/// This file contains the implementation of the [BaseHistoryRepository] interface.
/// This class is responsible for handling all the remote data sources for the history entity.
library;

import 'package:dartz/dartz.dart';
import 'package:gammal_tech_final_exam/core/error/exceptions.dart';
import 'package:gammal_tech_final_exam/core/error/faliure.dart';
import 'package:gammal_tech_final_exam/data/models/user_log_model.dart';
import 'package:gammal_tech_final_exam/data/remote_data_source/remote_history_data_source.dart';
import 'package:gammal_tech_final_exam/domain/repository/base_history_repository.dart';

/// HistoryRepositry class is responsible for handling all the remote data sources for the history entity.
class HistoryRepositry extends BaseHistoryRepository {
  final BaseRemoteHistoryDataSource baseRemoteHistoryDataSource;
  HistoryRepositry(this.baseRemoteHistoryDataSource);
  /// get history from the server
  /// on success : return list of history
  /// on failure : throw ServerException contains the error message and code
  @override
  Future<Either<Failure, List<UserLogModel>>> getHistory() async {
    try {
      return right(await baseRemoteHistoryDataSource.getHistoryList());
    } on ServerException catch (faliure) {
      return left(ServerFailure(faliure.errorMessageModel.message));
    }
  }
}
