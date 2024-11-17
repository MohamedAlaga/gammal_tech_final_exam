/// This file contains the remote data source for the User Data.
library;

import 'dart:convert';
import 'dart:io';

import 'package:fawry_sdk/model/launch_customer_model.dart';
import 'package:gammal_tech_final_exam/core/error/error_message_model.dart';
import 'package:gammal_tech_final_exam/core/error/exceptions.dart';
import 'package:gammal_tech_final_exam/core/utils/env.dart';
import 'package:gammal_tech_final_exam/data/models/user_model.dart';
import 'package:gammal_tech_final_exam/data/models/welcome_data_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

/// base class for the remote user data source
abstract class BaseRemoteUserDataSource {
  Future<UserModel> getUserData();
  Future<WelcomeDataModel> getWelcomeData();
  Future<UserModel> updateUserProfile(String? university, String? email,
      String? phoneNumber, String? bio, String? imageUrl, String? name);
  Future<bool> loginUser(String email, String password);
  Future<bool> logoutUser();
  Future<bool> validateUserToken();
  Future<LaunchCustomerModel> getUserPaymentInfo();
  Future<bool> recordUserPaymentInfo(String merRefNum);
  Future<bool> checkUserAttempts();
  Future<void> subtractAttempt();
  Future<bool> signupUser(String email, String password, String name);
  Future<bool> resetPassword(String email, String code, String newPassword);
  Future<bool> resetPasswordRequest(String email);
  Future<bool> verifyOtp(String email, String code);
  Future<Map<String, dynamic>> getImageSignature(String publicId);
  Future<bool> uploadImage(File image, String publicId);
}

/// RemoteUserDataSource class is responsible for handling all the remote data sources for the user entity.
class RemoteUserDataSource extends BaseRemoteUserDataSource {
  /// get user data from the server
  /// on success : return user data
  /// on failure : throw ServerException contains the error message and code
  @override
  Future<UserModel> getUserData() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var user = await http.get(
          Uri.parse("${baseUrl}users/${prefs.getString("userId").toString()}"));
      if (user.statusCode == 200) {
        var progress = await http.get(Uri.parse(
            "${baseUrl}courses/v2/${prefs.getString("userId").toString()}"));
        if (progress.statusCode == 200) {
          Map<String, double> userProgress = {};
          for (var item in jsonDecode(progress.body)) {
            userProgress[item["name"]] =
                (item["finished_quizzes"] / item["total_quizzes"]);
          }
          return Future.value(
              UserModel.fromJson(jsonDecode(user.body), userProgress));
        } else {
          throw ServerException(
              errorMessageModel: ErrorMessageModel(
                  message: "error accured getting user data",
                  statusCode: user.statusCode,
                  success: false));
        }
      } else {
        throw ServerException(
            errorMessageModel: ErrorMessageModel(
                message: "error accured getting user data",
                statusCode: user.statusCode,
                success: false));
      }
    } catch (e) {
      throw const ServerException(
          errorMessageModel: ErrorMessageModel(
              message: "error fitching user data",
              statusCode: 404,
              success: false));
    }
  }

  /// get welcome data from the server
  /// on success : return welcome data
  /// on failure : throw ServerException contains the error message and code
  @override
  getWelcomeData() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var result = await http.get(Uri.parse(
          "$baseUrl/users/welcome/${prefs.getString("userId").toString()}"));
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

  /// update user profile on the server
  /// on success : return updated user data
  /// on failure : throw ServerException contains the error message and code
  @override
  Future<UserModel> updateUserProfile(String? university, String? email,
      String? phoneNumber, String? bio, String? imageUrl, String? name) async {
    try {
      Map<String, String> user = {};
      if (email != null) {
        user["email"] = email;
      }
      if (phoneNumber != null) {
        user["phone"] = phoneNumber;
      }
      if (university != null) {
        user["university"] = university;
      }
      if (bio != null) {
        user["bio"] = bio;
      }
      if (imageUrl != null) {
        user["image_url"] = imageUrl;
      }
      if (name != null) {
        user["name"] = name;
      }
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var result = await http.put(
          Uri.parse("${baseUrl}users/${prefs.getString("userId").toString()}"),
          body: user);
      if (result.statusCode == 200) {
        return await getUserData();
      } else {
        throw ServerException(
            errorMessageModel: ErrorMessageModel(
                message: "error updating user profile",
                statusCode: result.statusCode,
                success: false));
      }
    } catch (e) {
      throw const ServerException(
          errorMessageModel: ErrorMessageModel(
              message: "error updating user profile",
              statusCode: 400,
              success: false));
    }
  }

  /// login user to the server
  ///
  /// try to login the user to the server using the email and password
  /// if the login success the user token will be saved in the shared preferences
  /// and the user id will be saved in the shared preferences
  ///
  /// on success : return true
  /// on failure : throw ServerException contains the error message and code
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

  /// logout user from the server
  /// delete the user token and user id from the shared preferences
  /// on success : return true
  /// on failure : throw ServerException contains the error message and code
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

  /// validate user token
  ///
  /// validate the user token by sending a request to the server
  /// if the token is valid the user id will be saved in the shared preferences
  ///
  /// on success : return true
  /// on failure : throw ServerException contains the error message and code
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
        prefs.setString(
            "userId", json.decode(userId.body)["userId"].toString());
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

  /// get user payment info from the server
  /// on success : return user payment info
  /// on failure : throw ServerException contains the error message and code
  @override
  Future<LaunchCustomerModel> getUserPaymentInfo() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var result = await http.get(
          Uri.parse("${baseUrl}users/${prefs.getString("userId").toString()}"));
      if (result.statusCode == 200) {
        var user = jsonDecode(result.body);
        return LaunchCustomerModel(
            customerName: user["name"],
            customerEmail: user["email"],
            customerMobile: user["phone"]);
      } else {
        throw ServerException(
            errorMessageModel: ErrorMessageModel(
                message: "error accured getting user payment info",
                statusCode: result.statusCode,
                success: false));
      }
    } catch (e) {
      throw const ServerException(
          errorMessageModel: ErrorMessageModel(
              message: "error accured getting user payment info",
              statusCode: 0,
              success: false));
    }
  }

  /// record user payment info on the server
  /// on success : return true
  /// on failure : throw ServerException contains the error message and code
  @override
  Future<bool> recordUserPaymentInfo(String merRefNum) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final Map<String, dynamic> requestBody = {
        "user_id": prefs.getString("userId").toString(),
        "merRefNum": merRefNum,
      };

      var result = await http.post(
        Uri.parse("${baseUrl}payments"),
        headers: {"Content-Type": "application/json"},
        body: json.encode(requestBody),
      );
      if (result.statusCode == 200) {
        return true;
      } else {
        throw ServerException(
            errorMessageModel: ErrorMessageModel(
                message: "error accured recording user payment info",
                statusCode: result.statusCode,
                success: false));
      }
    } catch (e) {
      throw const ServerException(
          errorMessageModel: ErrorMessageModel(
              message: "error accured recording user payment info",
              statusCode: 0,
              success: false));
    }
  }

  /// check user attempts
  /// on success : return true if the user has attempts
  /// on failure : throw ServerException contains the error message and code
  @override
  Future<bool> checkUserAttempts() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var result = await http.get(Uri.parse(
          "${baseUrl}users/${prefs.getString("userId").toString()}/attempts"));
      if (result.statusCode == 200) {
        return jsonDecode(result.body)["hasAttempts"];
      } else {
        throw ServerException(
            errorMessageModel: ErrorMessageModel(
                message: "error accured getting user attempts",
                statusCode: result.statusCode,
                success: false));
      }
    } catch (e) {
      throw const ServerException(
          errorMessageModel: ErrorMessageModel(
              message: "error accured getting user attempts",
              statusCode: 404,
              success: false));
    }
  }

  /// subtract one attempt from the user attempts
  /// on success : return void
  /// on failure : throw ServerException contains the error message and code
  @override
  Future<void> subtractAttempt() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var result = await http.put(Uri.parse(
        "${baseUrl}users/${prefs.getString("userId").toString()}/attempts/subtract"));
    if (result.statusCode != 200) {
      throw ServerException(
          errorMessageModel: ErrorMessageModel(
              message: "error accured subtracting user attempts",
              statusCode: result.statusCode,
              success: false));
    }
  }

  @override
  Future<bool> signupUser(String email, String password, String name) async {
    try {
      var result = await http.post(Uri.parse("${baseUrl}auth/signup"),
          body:
              jsonEncode({"email": email, "password": password, "name": name}),
          headers: {"Content-Type": "application/json"});
      if (result.statusCode == 200) {
        return true;
      } else {
        throw ServerException(
            errorMessageModel: ErrorMessageModel(
                message: "error signup user",
                statusCode: result.statusCode,
                success: false));
      }
    } catch (e) {
      throw const ServerException(
          errorMessageModel: ErrorMessageModel(
              message: "error signup user", statusCode: 400, success: false));
    }
  }

  @override
  Future<bool> resetPasswordRequest(String email) async {
    try {
      var result = await http.post(
          Uri.parse("${baseUrl}auth/request-reset-password"),
          body: jsonEncode({"email": email}),
          headers: {"Content-Type": "application/json"});
      if (result.statusCode == 200) {
        return true;
      } else {
        throw ServerException(
            errorMessageModel: ErrorMessageModel(
                message: "error reset password",
                statusCode: result.statusCode,
                success: false));
      }
    } catch (e) {
      throw const ServerException(
          errorMessageModel: ErrorMessageModel(
              message: "error reset password",
              statusCode: 400,
              success: false));
    }
  }

  @override
  Future<bool> resetPassword(
    String email,
    String code,
    String newPassword,
  ) async {
    try {
      var result = await http.post(Uri.parse("${baseUrl}auth/reset-password"),
          body: jsonEncode({
            "email": email,
            "new_password": newPassword,
            "verification_code": code
          }),
          headers: {"Content-Type": "application/json"});
      if (result.statusCode == 200) {
        return true;
      } else {
        throw ServerException(
            errorMessageModel: ErrorMessageModel(
                message: "error reset password",
                statusCode: result.statusCode,
                success: false));
      }
    } catch (e) {
      throw const ServerException(
          errorMessageModel: ErrorMessageModel(
              message: "error reset password",
              statusCode: 400,
              success: false));
    }
  }

  @override
  Future<bool> verifyOtp(String email, String code) async {
    try {
      var result = await http.post(Uri.parse("${baseUrl}auth/verify-code"),
          body: jsonEncode({"email": email, "verification_code": code}),
          headers: {"Content-Type": "application/json"});
      if (result.statusCode == 200) {
        return true;
      } else {
        throw ServerException(
            errorMessageModel: ErrorMessageModel(
                message: "error verify otp",
                statusCode: result.statusCode,
                success: false));
      }
    } catch (e) {
      throw const ServerException(
          errorMessageModel: ErrorMessageModel(
              message: "error verify otp", statusCode: 400, success: false));
    }
  }

  @override
  Future<Map<String, dynamic>> getImageSignature(String publicId) async {
    try {
      var result = await http.get(Uri.parse(
          "${localUrl}cloudinary/generate-signature?public_id=$publicId"));
      if (result.statusCode == 200) {
        return jsonDecode(result.body);
      } else {
        throw ServerException(
            errorMessageModel: ErrorMessageModel(
                message: "error getting image signature",
                statusCode: result.statusCode,
                success: false));
      }
    } catch (e) {
      throw const ServerException(
          errorMessageModel: ErrorMessageModel(
              message: "error getting image signature",
              statusCode: 404,
              success: false));
    }
  }

  @override
  Future<bool> uploadImage(File image, String publicId) async {
    try {
      var signature = await getImageSignature(publicId);
      final url = Uri.parse(
          'https://api.cloudinary.com/v1_1/$imageCloudName/image/upload');
      final request = http.MultipartRequest('POST', url)
        ..fields["file"] = image.path
        ..fields["public_id"] = publicId
        ..fields["api_key"] = signature["api_key"]
        ..fields["timestamp"] = signature["timestamp"].toString()
        ..fields["signature"] = signature["signature"];
      request.files.add(await http.MultipartFile.fromPath('file', image.path));
      final response = await request.send();
      if (response.statusCode == 200) {
        String body = await response.stream.bytesToString();
        updateUserProfile(null, null, null, null, jsonDecode(body)["url"], null);
        return true;
      } else {
        throw ServerException(
            errorMessageModel: ErrorMessageModel(
                message: "error uploading image",
                statusCode: response.statusCode,
                success: false));
      }
    } catch (e) {
      throw  ServerException(
          errorMessageModel: ErrorMessageModel(
              message: e.toString(),
              statusCode: 404,
              success: false));
    }
  }
}
