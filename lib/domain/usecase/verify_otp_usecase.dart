import 'package:dartz/dartz.dart';
import 'package:gammal_tech_final_exam/core/error/faliure.dart';
import 'package:gammal_tech_final_exam/domain/repository/base_user_repository.dart';

class VerifyOtpUsecase {
  final BaseUserRepository baseUserRepository;
  const VerifyOtpUsecase(this.baseUserRepository);

  Future<Either<Failure, bool>> execute(
      String email, String code) async {
    return await baseUserRepository.verifyOtp(email, code);
  }
}
