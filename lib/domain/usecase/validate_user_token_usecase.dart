import 'package:dartz/dartz.dart';
import 'package:gammal_tech_final_exam/core/error/faliure.dart';
import 'package:gammal_tech_final_exam/domain/repository/base_user_repository.dart';

class ValidateUserTokenUsecase {
  final BaseUserRepository baseUserRepository;

  ValidateUserTokenUsecase(this.baseUserRepository);

  Future<Either<Failure, bool>> execute() async {
    return await baseUserRepository.validateUserToken();
  }
}
