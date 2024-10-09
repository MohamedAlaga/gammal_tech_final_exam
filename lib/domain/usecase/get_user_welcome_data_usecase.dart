import 'package:dartz/dartz.dart';
import 'package:gammal_tech_final_exam/core/error/faliure.dart';
import 'package:gammal_tech_final_exam/domain/entities/welcome_data.dart';
import 'package:gammal_tech_final_exam/domain/repository/base_user_repository.dart';

class GetUserWelcomeDataUsecase {
  final BaseUserRepository baseUserRepository;
  
  GetUserWelcomeDataUsecase(this.baseUserRepository);

  Future<Either<Failure,WelcomeData>> execute(String userToken) async{
    return await baseUserRepository.getWelcomeData(userToken);
  }
}