/// This usecase is responsible for validating the user token
library;

import 'package:dartz/dartz.dart';
import 'package:gammal_tech_final_exam/core/error/faliure.dart';
import 'package:gammal_tech_final_exam/domain/repository/base_user_repository.dart';

/// [ValidateUserTokenUsecase] class to validate the user token
/// [baseUserRepository] is the repository that is used to validate the user token
/// [execute] method is used to validate the user token
class ValidateUserTokenUsecase {
  final BaseUserRepository baseUserRepository;

  ValidateUserTokenUsecase(this.baseUserRepository);

  /// [execute] method is used to validate the user token
  /// returns [Either] the result of the validating the user token
  /// [Failure] if there is an error
  /// [bool] if the user token is validated successfully
  Future<Either<Failure, bool>> execute() async {
    return await baseUserRepository.validateUserToken();
  }
}
