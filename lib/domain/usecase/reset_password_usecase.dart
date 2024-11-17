import 'package:dartz/dartz.dart';
import 'package:gammal_tech_final_exam/core/error/faliure.dart';
import 'package:gammal_tech_final_exam/domain/repository/base_user_repository.dart';

class ResetPasswordUsecase {
  final BaseUserRepository baseUserRepository;
  const ResetPasswordUsecase(this.baseUserRepository);

  Future<Either<Failure, bool>> execute(
      String email, String code, String newPassword) async {
    return await baseUserRepository.resetPassword(email, code, newPassword);
  }
}
