import 'package:dartz/dartz.dart';
import 'package:gammal_tech_final_exam/core/error/faliure.dart';
import 'package:gammal_tech_final_exam/domain/repository/base_user_repository.dart';

class LoginUserUsecase {
  final BaseUserRepository baseUserRepository;
  LoginUserUsecase(this.baseUserRepository);

  Future<Either<Failure, bool>> execute(String email, String password) async {
    final result = await baseUserRepository.loginUser(email, password);
    return result;
  }
}
