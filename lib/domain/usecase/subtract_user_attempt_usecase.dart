/// This usecase is responsible for subtracting the user's attempt
library;

import 'package:dartz/dartz.dart';
import 'package:gammal_tech_final_exam/core/error/faliure.dart';
import 'package:gammal_tech_final_exam/domain/repository/base_user_repository.dart';

/// [SubtractUserAttemptUsecase] class to subtract the user's attempt
/// [baseUserRepository] is the repository that is used to subtract the user's attempt
/// [execute] method is used to subtract the user's attempt
class SubtractUserAttemptUsecase {
  final BaseUserRepository baseUserRepository;

  SubtractUserAttemptUsecase(this.baseUserRepository);

  /// [execute] method is used to subtract the user's attempt
  /// returns [Either] the result of the subtracting the user's attempt
  /// [Failure] if there is an error
  /// [void] if the user's attempt is subtracted successfully
  Future<Either<Failure, void>> execute() async {
    return baseUserRepository.subtractAttempt();
  }
}
