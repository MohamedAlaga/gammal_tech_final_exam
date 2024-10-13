import 'dart:convert';

import 'package:gammal_tech_final_exam/core/error/error_message_model.dart';
import 'package:gammal_tech_final_exam/core/error/exceptions.dart';
import 'package:gammal_tech_final_exam/core/utils/env.dart';
import 'package:gammal_tech_final_exam/data/models/user_model.dart';
import 'package:gammal_tech_final_exam/core/utils/dummy.dart' as dummy;
import 'package:gammal_tech_final_exam/data/models/welcome_data_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class BaseRemoteUserDataSource {
  Future<UserModel> getUserData(String userToken);
  Future<WelcomeDataModel> getWelcomeData(String userToken);
  Future<bool> updateUserProfile(String userToken, UserModel user);
  Future<bool> loginUser(String email, String password);
  Future<bool> logoutUser();
  Future<bool> validateUserToken();
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
  getWelcomeData(String userToken) async{
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var result = await http.get(Uri.parse("$baseUrl/users/welcome/${prefs.getString("userId").toString()}"));
      if (result.statusCode == 200) {
        return WelcomeDataModel.fromJson(jsonDecode(result.body));
      } else {
        throw ServerException(
            errorMessageModel: ErrorMessageModel(
                message: "error accured getting welcome data",
                statusCode: result.statusCode,
                success: false));
      }
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

  @override
  Future<bool> loginUser(String email, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var result = await http.post(Uri.parse("${baseUrl}auth/login"),
        body: {"UserName": email, "Password": password});
    if (result.statusCode == 200) {
      prefs.setString("token", jsonDecode(result.body)["token"]);
      return validateUserToken();
    } else if (result.statusCode == 401) {
      throw const ServerException(
          errorMessageModel: ErrorMessageModel(
              message: "invalid email or password",
              statusCode: 401,
              success: false));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel(
              message: "error login user",
              statusCode: result.statusCode,
              success: false));
    }
  }

  @override
  Future<bool> logoutUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      await prefs.remove("token");
      await prefs.remove("userId");
      return true;
    } catch (e) {
      throw const ServerException(
          errorMessageModel: ErrorMessageModel(
              message: "error logout user", statusCode: 404, success: false));
    }
  }

  @override
  Future<bool> validateUserToken() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (prefs.getString("token") == null) {
        throw const ServerException(
            errorMessageModel: ErrorMessageModel(
                message: "token not found", statusCode: 404, success: false));
      }
      var userId = await http.post(Uri.parse("${baseUrl}auth/token-check"),
          headers: {"Authorization": prefs.getString("token").toString()});
      if (userId.statusCode == 200) {
        prefs.setString("userId", json.decode(userId.body)["userId"].toString());
      } else {
        throw ServerException(
            errorMessageModel: ErrorMessageModel(
                message: "error getting user id",
                statusCode: userId.statusCode,
                success: false));
      }
      return true;
    } catch (e) {
      throw const ServerException(
          errorMessageModel: ErrorMessageModel(
              message: "error validating user token",
              statusCode: 404,
              success: false));
    }
  }
}
