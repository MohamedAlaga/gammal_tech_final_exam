/// this file contains the usecase for checking the user attempts
import 'package:dartz/dartz.dart';
import 'package:gammal_tech_final_exam/core/error/faliure.dart';
import 'package:gammal_tech_final_exam/domain/repository/base_user_repository.dart';

/// [CheckUserAttemptsUsecase] class to check the user attempts
/// [baseUserRepository] is the repository that is used to get the user data from the server
/// [execute] method is used to check if user have attempts
class CheckUserAttemptsUsecase {
  final BaseUserRepository baseUserRepository;

  CheckUserAttemptsUsecase(this.baseUserRepository);

  /// [execute] method is used to check the user attempts
  /// returns [Either] the result of the user attempts
  /// [Failure] if there is an error
  /// [bool] if the user have attempts
  Future<Either<Failure, bool>> execute() async {
    return await baseUserRepository.checkUserAttempts();
  }
}
