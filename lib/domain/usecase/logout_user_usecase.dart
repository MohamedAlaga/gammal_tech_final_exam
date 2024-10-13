import 'package:dartz/dartz.dart';
import 'package:gammal_tech_final_exam/core/error/faliure.dart';
import 'package:gammal_tech_final_exam/domain/repository/base_user_repository.dart';

class LogoutUserUsecase {
  final BaseUserRepository baseUserRepository;
  LogoutUserUsecase(this.baseUserRepository);

  Future<Either<Failure, bool>> execute() async {
    return await baseUserRepository.logoutUser();
  }
}
