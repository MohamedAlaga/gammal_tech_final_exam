/// this file contains usecase needed to login user
library;

import 'package:dartz/dartz.dart';
import 'package:gammal_tech_final_exam/core/error/faliure.dart';
import 'package:gammal_tech_final_exam/domain/repository/base_user_repository.dart';

/// [LoginUserUsecase] class to login user
/// [baseUserRepository] is the repository that is used to login the user
/// [execute] method is used to login the user
class LoginUserUsecase {
  final BaseUserRepository baseUserRepository;
  LoginUserUsecase(this.baseUserRepository);

  /// [execute] method is used to login the user
  /// returns [Either] the result of the login
  /// [Failure] if there is an error
  /// [bool] if the user is logged in successfully
  Future<Either<Failure, bool>> execute(String email, String password) async {
    final result = await baseUserRepository.loginUser(email, password);
    return result;
  }
}
