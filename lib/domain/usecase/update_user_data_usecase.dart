import 'package:dartz/dartz.dart';
import 'package:gammal_tech_final_exam/core/error/faliure.dart';
import 'package:gammal_tech_final_exam/domain/entities/user.dart';
import 'package:gammal_tech_final_exam/domain/repository/base_user_repository.dart';

class UpdateUserDataUsecase {
  final BaseUserRepository baseUserRepository;

  UpdateUserDataUsecase(this.baseUserRepository);

  Future<Either<Failure, User>> execute(String? university, String? email,
      String? phoneNumber, String? bio, String? imageUrl, String? name) async {
    return await baseUserRepository.updateUserProfile(
        university, email, phoneNumber, bio, imageUrl, name);
  }
}
