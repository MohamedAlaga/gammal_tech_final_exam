import 'package:dartz/dartz.dart';
import 'package:gammal_tech_final_exam/core/error/faliure.dart';
import 'package:gammal_tech_final_exam/data/models/user_model.dart';
import 'package:gammal_tech_final_exam/domain/entities/user.dart';
import 'package:gammal_tech_final_exam/domain/entities/welcome_data.dart';

abstract class BaseUserRepository {
  Future<Either<Failure, User>> getUserData(String userToken);
  Future<Either<Failure, WelcomeData>> getWelcomeData(String userToken);
  Future<Either<Failure, bool>> updateUserProfile(String userToken, UserModel user);
  Future<Either<Failure, bool>> loginUser(String email, String password);
  Future<Either<Failure, bool>> logoutUser();
  Future<Either<Failure, bool>> validateUserToken();
}
