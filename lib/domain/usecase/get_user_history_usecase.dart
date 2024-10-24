/// This file contains the usecase class that is responsible for getting the user history from the repository.
library;
import 'package:dartz/dartz.dart';
import 'package:gammal_tech_final_exam/core/error/faliure.dart';
import 'package:gammal_tech_final_exam/domain/entities/user_log.dart';
import 'package:gammal_tech_final_exam/domain/repository/base_history_repository.dart';

/// [GetUserHistoryUsecase] class to get the user history
/// [baseHistoryRepository] is the repository that is used to get the user history data from the server
/// [execute] method is used to get the user history
class GetUserHistoryUsecase {
  final BaseHistoryRepository baseHistoryRepository;
  GetUserHistoryUsecase(this.baseHistoryRepository);

  /// [execute] method is used to get the user history
  /// returns [Either] the result of the user history
  /// [Failure] if there is an error
  /// [List<UserLog>] if the user history is fetched successfully
  Future<Either<Failure, List<UserLog>>> execute() async{
    return await baseHistoryRepository.getHistory();
  }
}
