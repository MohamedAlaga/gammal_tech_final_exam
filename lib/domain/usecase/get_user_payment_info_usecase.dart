import 'package:dartz/dartz.dart';
import 'package:fawry_sdk/model/launch_customer_model.dart';
import 'package:gammal_tech_final_exam/core/error/faliure.dart';
import 'package:gammal_tech_final_exam/domain/repository/base_user_repository.dart';

class GetUserPaymentInfoUsecase {
  final BaseUserRepository baseUserRepository;
  GetUserPaymentInfoUsecase(this.baseUserRepository);

  Future<Either<Failure, LaunchCustomerModel>> execute() async{
    return await baseUserRepository.getUserPaymentInfo();
  }
}