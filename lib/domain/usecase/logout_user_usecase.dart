/// This usecase is responsible for logging out the user from the app.
library;

import 'package:dartz/dartz.dart';
import 'package:gammal_tech_final_exam/core/error/faliure.dart';
import 'package:gammal_tech_final_exam/domain/repository/base_user_repository.dart';

/// [LogoutUserUsecase] class to logout the user
/// [baseUserRepository] is the repository that is used to logout the user
/// [execute] method is used to logout the user
class LogoutUserUsecase {
  final BaseUserRepository baseUserRepository;
  LogoutUserUsecase(this.baseUserRepository);

  /// [execute] method is used to logout the user
  /// returns [Either] the result of the logout
  /// [Failure] if there is an error
  /// [bool] if the user is logged out successfully
  Future<Either<Failure, bool>> execute() async {
    return await baseUserRepository.logoutUser();
  }
}
