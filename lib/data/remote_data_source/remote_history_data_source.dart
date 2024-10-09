import 'package:gammal_tech_final_exam/core/error/error_message_model.dart';
import 'package:gammal_tech_final_exam/core/error/exceptions.dart';
import 'package:gammal_tech_final_exam/data/models/user_log_model.dart';
import 'package:gammal_tech_final_exam/core/utils/dummy.dart' as dummy;

abstract class BaseRemoteHistoryDataSource {
  Future<List<UserLogModel>> getHistoryList(String userToken);
}

class RemoteHistoryDataSource extends BaseRemoteHistoryDataSource {
  @override
  Future<List<UserLogModel>> getHistoryList(String userToken) async {
    try {
      return Future.delayed(
          const Duration(seconds: 1), () => dummy.userHistoryList);
    } catch (e) {
      throw const ServerException(
          errorMessageModel: ErrorMessageModel(
              message: "error getting user history",
              statusCode: 404,
              success: false));
    }
  }
}
