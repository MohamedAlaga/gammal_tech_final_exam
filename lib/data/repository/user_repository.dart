/// This file contains the implementation of the [BaseUserRepository] interface.
/// This class is responsible for handling all the remote data sources for the user entity.
library;

import 'package:dartz/dartz.dart';
import 'package:fawry_sdk/model/launch_customer_model.dart';
import 'package:gammal_tech_final_exam/core/error/exceptions.dart';
import 'package:gammal_tech_final_exam/core/error/faliure.dart';
import 'package:gammal_tech_final_exam/data/models/user_model.dart';
import 'package:gammal_tech_final_exam/data/models/welcome_data_model.dart';
import 'package:gammal_tech_final_exam/data/remote_data_source/remote_user_data_source.dart';
import 'package:gammal_tech_final_exam/domain/repository/base_user_repository.dart';

/// UserRepository class is responsible for handling all the remote data sources for the user entity.
class UserRepository extends BaseUserRepository {
  final BaseRemoteUserDataSource remoteUserDataSource;
  UserRepository(this.remoteUserDataSource);

  /// get all user data from the server
  /// on success : return user model
  /// on failure : throw ServerException contains the error message and code
  @override
  Future<Either<Failure, UserModel>> getUserData() async {
    try {
      return right(await remoteUserDataSource.getUserData());
    } on ServerException catch (faliure) {
      return Left(ServerFailure(faliure.errorMessageModel.message));
    }
  }

  /// get welcome data from the server
  /// on success : return welcome data model
  /// on failure : throw ServerException contains the error message and code
  @override
  Future<Either<Failure, WelcomeDataModel>> getWelcomeData() async {
    try {
      return right(await remoteUserDataSource.getWelcomeData());
    } on ServerException catch (faliure) {
      return Left(ServerFailure(faliure.errorMessageModel.message));
    }
  }

  /// update user profile data on the server
  /// on success : return user model
  /// on failure : throw ServerException contains the error message and code
  @override
  Future<Either<Failure, UserModel>> updateUserProfile(
      String? university,
      String? email,
      String? phoneNumber,
      String? bio,
      String? imageUrl,
      String? name) async {
    try {
      return right(await remoteUserDataSource.updateUserProfile(
          university, email, phoneNumber, bio, imageUrl, name));
    } on ServerException catch (faliure) {
      return Left(ServerFailure(faliure.errorMessageModel.message));
    }
  }

  /// login user to the server
  /// on success : return bool
  /// on failure : throw ServerException contains the error message and code
  @override
  Future<Either<Failure, bool>> loginUser(String email, String password) async {
    try {
      return right(await remoteUserDataSource.loginUser(email, password));
    } on ServerException catch (faliure) {
      return Left(ServerFailure(faliure.errorMessageModel.message));
    }
  }

  /// register user to the server
  /// on success : return bool
  /// on failure : throw ServerException contains the error message and code
  @override
  Future<Either<Failure, bool>> logoutUser() async {
    try {
      return right(await remoteUserDataSource.logoutUser());
    } on ServerException catch (faliure) {
      return Left(ServerFailure(faliure.errorMessageModel.message));
    }
  }

  /// validate user token on the server
  /// on success : return bool
  /// on failure : throw ServerException contains the error message and code
  @override
  Future<Either<Failure, bool>> validateUserToken() async {
    try {
      return right(await remoteUserDataSource.validateUserToken());
    } on ServerException catch (faliure) {
      return Left(ServerFailure(faliure.errorMessageModel.message));
    }
  }

  /// get the user payment info from the server
  /// on success : return launch customer model
  /// on failure : throw ServerException contains the error message and code
  @override
  Future<Either<Failure, LaunchCustomerModel>> getUserPaymentInfo() async {
    try {
      return right(await remoteUserDataSource.getUserPaymentInfo());
    } on ServerException catch (faliure) {
      return Left(ServerFailure(faliure.errorMessageModel.message));
    }
  }

  /// get the user info from the server
  /// on success : return launch customer model
  /// on failure : throw ServerException contains the error message and code
  @override
  Future<Either<Failure, LaunchCustomerModel>> getUserCardsManagerInfo() async {
    try {
      return right(await remoteUserDataSource.getUserCardsManagerInfo());
    } on ServerException catch (faliure) {
      return Left(ServerFailure(faliure.errorMessageModel.message));
    }
  }

  /// record user payment info on the server
  /// on success : return bool
  /// on failure : throw ServerException contains the error message and code
  @override
  Future<Either<Failure, bool>> recordUserPaymentInfo(String merRefNum) async {
    try {
      return right(await remoteUserDataSource.recordUserPaymentInfo(merRefNum));
    } on ServerException catch (faliure) {
      return Left(ServerFailure(faliure.errorMessageModel.message));
    }
  }

  /// check user attempts on the server
  /// on success : return bool
  /// on failure : throw ServerException contains the error message and code
  @override
  Future<Either<Failure, bool>> checkUserAttempts() async {
    try {
      return right(await remoteUserDataSource.checkUserAttempts());
    } on ServerException catch (faliure) {
      return Left(ServerFailure(faliure.errorMessageModel.message));
    }
  }

  /// add user attempt on the server
  /// on success : return void
  /// on failure : throw ServerException contains the error message and code
  @override
  Future<Either<Failure, void>> subtractAttempt() async {
    try {
      return right(await remoteUserDataSource.subtractAttempt());
    } on ServerException catch (faliure) {
      return Left(ServerFailure(faliure.errorMessageModel.message));
    }
  }
}
