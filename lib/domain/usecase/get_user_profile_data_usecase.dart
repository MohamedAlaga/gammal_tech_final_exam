import 'package:dartz/dartz.dart';
import 'package:gammal_tech_final_exam/core/error/faliure.dart';
import 'package:gammal_tech_final_exam/domain/entities/user.dart';
import 'package:gammal_tech_final_exam/domain/repository/base_user_repository.dart';

class GetUserProfileDataUsecase {
  final BaseUserRepository baseUserRepository;

  GetUserProfileDataUsecase(this.baseUserRepository);

  Future<Either<Failure, User>> execute(String userToken) async {
    return await baseUserRepository.getUserData(userToken);
  }
}
