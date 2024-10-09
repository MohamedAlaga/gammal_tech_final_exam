import 'package:dartz/dartz.dart';
import 'package:gammal_tech_final_exam/core/error/exceptions.dart';
import 'package:gammal_tech_final_exam/core/error/faliure.dart';
import 'package:gammal_tech_final_exam/data/models/user_log_model.dart';
import 'package:gammal_tech_final_exam/data/remote_data_source/remote_history_data_source.dart';
import 'package:gammal_tech_final_exam/domain/repository/base_history_repository.dart';

class HistoryRepositry extends BaseHistoryRepository {
  final BaseRemoteHistoryDataSource baseRemoteHistoryDataSource;
  HistoryRepositry(this.baseRemoteHistoryDataSource);
  @override
  Future<Either<Failure, List<UserLogModel>>> getHistory(
      String userToken) async {
    try {
      return right(await baseRemoteHistoryDataSource.getHistoryList(userToken));
    } on ServerException catch (faliure) {
      return left(ServerFailure(faliure.errorMessageModel.message));
    }
  }
}