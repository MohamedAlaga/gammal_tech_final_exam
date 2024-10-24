/// This usecase is responsible for recording the user payment info
library;

import 'package:dartz/dartz.dart';
import 'package:gammal_tech_final_exam/core/error/faliure.dart';
import 'package:gammal_tech_final_exam/domain/repository/base_user_repository.dart';

/// [RecordUserPaymentInfoUsecase] class to record the user payment info
/// [baseUserRepository] is the repository that is used to record the user payment info
/// [execute] method is used to record the user payment info
class RecordUserPaymentInfoUsecase {
  final BaseUserRepository baseUserRepository;
  const RecordUserPaymentInfoUsecase(this.baseUserRepository);

  /// [execute] method is used to record the user payment info
  /// returns [Either] the result of the user payment info
  /// [Failure] if there is an error
  /// [bool] if the user payment info is recorded successfully
  Future<Either<Failure, bool>> execute(String merRefNum) async {
    return await baseUserRepository.recordUserPaymentInfo(merRefNum);
  }
}
