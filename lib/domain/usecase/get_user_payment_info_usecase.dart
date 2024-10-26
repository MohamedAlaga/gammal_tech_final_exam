/// this file contains usecase to get user payment info
library;

import 'package:dartz/dartz.dart';
import 'package:fawry_sdk/model/launch_customer_model.dart';
import 'package:gammal_tech_final_exam/core/error/faliure.dart';
import 'package:gammal_tech_final_exam/domain/repository/base_user_repository.dart';

/// [GetUserPaymentInfoUsecase] class to get user payment info
/// [baseUserRepository] is the repository that is used to get the user payment info data from the server
/// [execute] method is used to get user payment info
class GetUserPaymentInfoUsecase {
  final BaseUserRepository baseUserRepository;
  GetUserPaymentInfoUsecase(this.baseUserRepository);

  /// [execute] method is used to get user payment info
  /// returns [Either] the result of the user payment info
  /// [Failure] if there is an error
  /// [LaunchCustomerModel] if the user payment info is fetched successfully
  Future<Either<Failure, LaunchCustomerModel>> execute() async{
    return await baseUserRepository.getUserPaymentInfo();
  }
}