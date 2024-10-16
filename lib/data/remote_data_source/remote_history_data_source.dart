import 'dart:convert';

import 'package:gammal_tech_final_exam/core/error/error_message_model.dart';
import 'package:gammal_tech_final_exam/core/error/exceptions.dart';
import 'package:gammal_tech_final_exam/core/utils/env.dart';
import 'package:gammal_tech_final_exam/data/models/user_log_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class BaseRemoteHistoryDataSource {
  Future<List<UserLogModel>> getHistoryList();
}

class RemoteHistoryDataSource extends BaseRemoteHistoryDataSource {
  @override
  Future<List<UserLogModel>> getHistoryList() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var result = await http.get(Uri.parse("${baseUrl}quiz/user/${prefs.getString("userId").toString()}"));
      if (result.statusCode == 200) {
        List<UserLogModel> userLogList = [];
        for (var item in jsonDecode(result.body)) {
          userLogList.add(UserLogModel.fromJson(item));
        }
        return userLogList;
      } else {
        throw ServerException(
            errorMessageModel: ErrorMessageModel(
                message: "error getting user history",
                statusCode: result.statusCode,
                success: false));
      }
    } catch (e) {
      throw const ServerException(
          errorMessageModel: ErrorMessageModel(
              message: "error getting user history",
              statusCode: 404,
              success: false));
    }
  }
}
