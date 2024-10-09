import 'package:gammal_tech_final_exam/core/error/error_message_model.dart';
import 'package:gammal_tech_final_exam/core/error/exceptions.dart';
import 'package:gammal_tech_final_exam/data/models/user_model.dart';
import 'package:gammal_tech_final_exam/core/utils/dummy.dart' as dummy;
import 'package:gammal_tech_final_exam/data/models/welcome_data_model.dart';

abstract class BaseRemoteUserDataSource {
  Future<UserModel> getUserData(String userToken);
  Future<WelcomeDataModel> getWelcomeData(String userToken);
  Future<bool> updateUserProfile(String userToken, UserModel user);
}

class RemoteUserDataSource extends BaseRemoteUserDataSource {
  @override
  Future<UserModel> getUserData(String userToken) {
    try {
      return (Future.delayed(const Duration(seconds: 1), () => dummy.user));
    } catch (e) {
      throw const ServerException(
          errorMessageModel: ErrorMessageModel(
              message: "error fitching user data",
              statusCode: 404,
              success: false));
    }
  }

  @override
  getWelcomeData(String userToken) {
    try {
      return (Future.delayed(
          const Duration(seconds: 1), () => dummy.welcomeData));
    } catch (e) {
      throw const ServerException(
          errorMessageModel: ErrorMessageModel(
              message: "error fitching welcome data",
              statusCode: 404,
              success: false));
    }
  }

  @override
  Future<bool> updateUserProfile(String userToken, UserModel user) {
    try {
      return Future.delayed(const Duration(seconds: 1), () => true);
    } catch (e) {
      throw const ServerException(
          errorMessageModel: ErrorMessageModel(
              message: "error updating user profile",
              statusCode: 404,
              success: false));
    }
  }
}
