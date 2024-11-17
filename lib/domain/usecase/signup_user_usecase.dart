import 'package:dartz/dartz.dart';
import 'package:gammal_tech_final_exam/core/error/faliure.dart';
import 'package:gammal_tech_final_exam/domain/repository/base_user_repository.dart';

class SignupUserUsecase {
  final BaseUserRepository baseUserRepository;
  const SignupUserUsecase(this.baseUserRepository);

  Future<Either<Failure, bool>> execute(
      String email, String password, String name) async {
    return await baseUserRepository.signupUser(email, password, name);
  }
}
