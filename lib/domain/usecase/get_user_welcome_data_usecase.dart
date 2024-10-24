/// This file contains the usecase class that is responsible for getting the welcome data from the repository.
library;

import 'package:dartz/dartz.dart';
import 'package:gammal_tech_final_exam/core/error/faliure.dart';
import 'package:gammal_tech_final_exam/domain/entities/welcome_data.dart';
import 'package:gammal_tech_final_exam/domain/repository/base_user_repository.dart';

/// [GetUserWelcomeDataUsecase] class to get the welcome data
/// [baseUserRepository] is the repository that is used to get the welcome data from the server
/// [execute] method is used to get the welcome data
class GetUserWelcomeDataUsecase {
  final BaseUserRepository baseUserRepository;
  
  GetUserWelcomeDataUsecase(this.baseUserRepository);

  /// [execute] method is used to get the welcome data
  /// returns [Either] the result of the welcome data
  /// [Failure] if there is an error
  /// [WelcomeData] if the welcome data is fetched successfully
  Future<Either<Failure,WelcomeData>> execute() async{
    return await baseUserRepository.getWelcomeData();
  }
}
