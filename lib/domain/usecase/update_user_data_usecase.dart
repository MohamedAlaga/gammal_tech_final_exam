import 'package:dartz/dartz.dart';
import 'package:gammal_tech_final_exam/core/error/faliure.dart';
import 'package:gammal_tech_final_exam/data/models/user_model.dart';
import 'package:gammal_tech_final_exam/domain/repository/base_user_repository.dart';

class UpdateUserDataUsecase {
  final BaseUserRepository baseUserRepository;

  UpdateUserDataUsecase(this.baseUserRepository);

  Future<Either<Failure, bool>> execute(UserModel user, String userToken) async{
    return await baseUserRepository.updateUserProfile(userToken, user);
  }
}
