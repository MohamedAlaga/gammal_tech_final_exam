/// this file contains usecase to get user cards info and manager
library;

import 'package:dartz/dartz.dart';
import 'package:fawry_sdk/model/launch_customer_model.dart';
import 'package:gammal_tech_final_exam/core/error/faliure.dart';
import 'package:gammal_tech_final_exam/domain/repository/base_user_repository.dart';

/// [GetUserCardsManagerInfoUsecase] class to get user cards info and manager
/// [baseUserRepository] is the repository that is used to get the user cards info and manager data from the server
/// [execute] method is used to get user cards info and manager
class GetUserCardsManagerInfoUsecase {
  final BaseUserRepository baseUserRepository;
  GetUserCardsManagerInfoUsecase(this.baseUserRepository);

  /// [execute] method is used to get user cards info and manager
  /// returns [Either] the result of the user cards info and manager
  /// [Failure] if there is an error
  /// [LaunchCustomerModel] if the user cards info and manager is fetched successfully
  Future<Either<Failure, LaunchCustomerModel>> execute() async {
    return await baseUserRepository.getUserCardsManagerInfo();
  }
}
