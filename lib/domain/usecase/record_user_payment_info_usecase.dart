import 'package:dartz/dartz.dart';
import 'package:gammal_tech_final_exam/core/error/faliure.dart';
import 'package:gammal_tech_final_exam/domain/repository/base_user_repository.dart';

class RecordUserPaymentInfoUsecase {
  final BaseUserRepository baseUserRepository;
  const RecordUserPaymentInfoUsecase(this.baseUserRepository);

  Future<Either<Failure, bool>> execute(String merRefNum) async {
    return await baseUserRepository.recordUserPaymentInfo(merRefNum);
  }
}
