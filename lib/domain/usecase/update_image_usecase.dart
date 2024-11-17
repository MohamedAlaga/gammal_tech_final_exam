import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:gammal_tech_final_exam/core/error/faliure.dart';
import 'package:gammal_tech_final_exam/domain/repository/base_user_repository.dart';

class UpdateImageUsecase {
  BaseUserRepository baseUserRepository;
  UpdateImageUsecase(this.baseUserRepository);

  Future<Either<Failure, bool>> execute(File image, String publicId) async {
    return baseUserRepository.updateImage(image, publicId);
  }
}
