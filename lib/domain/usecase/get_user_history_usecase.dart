import 'package:dartz/dartz.dart';
import 'package:gammal_tech_final_exam/core/error/faliure.dart';
import 'package:gammal_tech_final_exam/domain/entities/user_log.dart';
import 'package:gammal_tech_final_exam/domain/repository/base_history_repository.dart';

class GetUserHistoryUsecase {
  final BaseHistoryRepository baseHistoryRepository;
  GetUserHistoryUsecase(this.baseHistoryRepository);

  Future<Either<Failure, List<UserLog>>> execute() async{
    return await baseHistoryRepository.getHistory();
  }
}
