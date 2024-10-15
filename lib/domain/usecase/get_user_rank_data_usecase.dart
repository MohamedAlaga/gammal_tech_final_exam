import 'package:dartz/dartz.dart';
import 'package:gammal_tech_final_exam/domain/entities/user_rank.dart';
import 'package:gammal_tech_final_exam/domain/repository/base_user_rank_repository.dart';

import '../../core/error/faliure.dart';

class GetUserRankUsecase {
  final BaseUserRankRepository baseUserRankRepository;

  GetUserRankUsecase(this.baseUserRankRepository);

  Future<Either<Failure, List<UserRank>>> execute() async {
    return await baseUserRankRepository.getUserRankings();
  }
}
