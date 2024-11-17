import 'package:dartz/dartz.dart';
import 'package:gammal_tech_final_exam/core/error/faliure.dart';
import 'package:gammal_tech_final_exam/domain/repository/base_user_repository.dart';

class ResetPasswordRequestUsecase {
  final BaseUserRepository baseUserRepository;
  const ResetPasswordRequestUsecase(this.baseUserRepository);

  Future<Either<Failure, bool>> execute(String email) async {
    return await baseUserRepository.resetPasswordRequest(email);
  }
}
