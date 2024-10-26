/// This file contains the usecase class that is responsible for getting the user profile data from the repository.
library;

import 'package:dartz/dartz.dart';
import 'package:gammal_tech_final_exam/core/error/faliure.dart';
import 'package:gammal_tech_final_exam/domain/entities/user.dart';
import 'package:gammal_tech_final_exam/domain/repository/base_user_repository.dart';

/// [GetUserProfileDataUsecase] class to get the user profile data
/// [baseUserRepository] is the repository that is used to get the user profile data from the server
/// [execute] method is used to get the user profile data
class GetUserProfileDataUsecase {
  final BaseUserRepository baseUserRepository;

  GetUserProfileDataUsecase(this.baseUserRepository);

  /// [execute] method is used to get the user profile data
  /// [Either] the result of the user profile data
  /// [Failure] if there is an error
  /// [User] if the user profile data is fetched successfully
  Future<Either<Failure, User>> execute() async {
    return await baseUserRepository.getUserData();
  }
}
