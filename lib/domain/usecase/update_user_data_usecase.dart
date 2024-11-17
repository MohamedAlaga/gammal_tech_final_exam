/// This file contains the usecase for updating the user data
library;

import 'package:dartz/dartz.dart';
import 'package:gammal_tech_final_exam/core/error/faliure.dart';
import 'package:gammal_tech_final_exam/domain/entities/user.dart';
import 'package:gammal_tech_final_exam/domain/repository/base_user_repository.dart';

/// [UpdateUserDataUsecase] class to update the user data
/// [baseUserRepository] is the repository that is used to update the user data
/// [execute] method is used to update the user data
class UpdateUserDataUsecase {
  final BaseUserRepository baseUserRepository;

  UpdateUserDataUsecase(this.baseUserRepository);

  /// [execute] method is used to update the user data
  /// returns [Either] the result of the user data
  /// [Failure] if there is an error
  /// [User] if the user data is updated successfully
  Future<Either<Failure, User>> execute(String? university, String? email,
      String? phoneNumber, String? bio, String? name) async {
    return await baseUserRepository.updateUserProfile(
        university, email, phoneNumber, bio,  name);
  }
}
