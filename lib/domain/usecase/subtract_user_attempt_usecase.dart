import 'package:dartz/dartz.dart';
import 'package:gammal_tech_final_exam/core/error/faliure.dart';
import 'package:gammal_tech_final_exam/domain/repository/base_user_repository.dart';

class SubtractUserAttemptUsecase {
  final BaseUserRepository baseUserRepository;

  SubtractUserAttemptUsecase(this.baseUserRepository);

  Future<Either<Failure, void>> execute() async {
    return baseUserRepository.subtractAttempt();
  }
}
