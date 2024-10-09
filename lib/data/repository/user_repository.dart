import 'package:dartz/dartz.dart';
import 'package:gammal_tech_final_exam/core/error/exceptions.dart';
import 'package:gammal_tech_final_exam/core/error/faliure.dart';
import 'package:gammal_tech_final_exam/data/models/user_model.dart';
import 'package:gammal_tech_final_exam/data/models/welcome_data_model.dart';
import 'package:gammal_tech_final_exam/data/remote_data_source/remote_user_data_source.dart';
import 'package:gammal_tech_final_exam/domain/repository/base_user_repository.dart';

class UserRepository extends BaseUserRepository {
  final BaseRemoteUserDataSource remoteUserDataSource;
  UserRepository(this.remoteUserDataSource);

  @override
  Future<Either<Failure, UserModel>> getUserData(String userToken) async {
    try {
      return right(await remoteUserDataSource.getUserData(userToken));
    } on ServerException catch (faliure) {
      return Left(ServerFailure(faliure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, WelcomeDataModel>> getWelcomeData(
      String userToken) async {
    try {
      return right(await remoteUserDataSource.getWelcomeData(userToken));
    } on ServerException catch (faliure) {
      return Left(ServerFailure(faliure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, bool>> updateUserProfile(
      String userToken, UserModel user) async {
    try {
      return right(
          await remoteUserDataSource.updateUserProfile(userToken, user));
    } on ServerException catch (faliure) {
      return Left(ServerFailure(faliure.errorMessageModel.message));
    }
  }
}
