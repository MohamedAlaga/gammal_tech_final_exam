/// this file contains the abstract class [BaseUserRepository] that is used to define the methods that should be implemented in the data layer to get the user data from the server.
library;

import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fawry_sdk/model/launch_customer_model.dart';
import 'package:gammal_tech_final_exam/core/error/faliure.dart';
import 'package:gammal_tech_final_exam/domain/entities/user.dart';
import 'package:gammal_tech_final_exam/domain/entities/welcome_data.dart';

/// [BaseUserRepository] abstract class to define the methods that should be implemented in the data layer to get the user data from the server.
abstract class BaseUserRepository {
  Future<Either<Failure, User>> getUserData();
  Future<Either<Failure, WelcomeData>> getWelcomeData();
  Future<Either<Failure, User>> updateUserProfile(
      String? university,
      String? email,
      String? phoneNumber,
      String? bio,
      String? name);
  Future<Either<Failure, bool>> loginUser(String email, String password);
  Future<Either<Failure, bool>> logoutUser();
  Future<Either<Failure, bool>> validateUserToken();
  Future<Either<Failure, LaunchCustomerModel>> getUserPaymentInfo();
  Future<Either<Failure, LaunchCustomerModel>> getUserCardsManagerInfo();
  Future<Either<Failure, bool>> recordUserPaymentInfo(String merRefNum);
  Future<Either<Failure, bool>> checkUserAttempts();
  Future<Either<Failure, void>> subtractAttempt();
  Future<Either<Failure, bool>> signupUser(
      String email, String password, String name);
  Future<Either<Failure, bool>> resetPasswordRequest(String email);
  Future<Either<Failure, bool>> resetPassword(
      String email, String code, String newPassword);
  Future<Either<Failure, bool>> verifyOtp(String email, String code);
  Future<Either<Failure, bool>> updateImage(File image, String publicId);
}
