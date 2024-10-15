import 'dart:convert';

import 'package:gammal_tech_final_exam/core/error/error_message_model.dart';
import 'package:gammal_tech_final_exam/core/error/exceptions.dart';
import 'package:gammal_tech_final_exam/data/models/user_rank_model.dart';
import 'package:gammal_tech_final_exam/domain/entities/user_rank.dart';
import 'package:http/http.dart' as http;

import '../../core/utils/env.dart';

abstract class BaseRemoteUserRankDataSource {
  Future<List<UserRank>> getUserRankings();
}

class RemoteUserRankDataSource extends BaseRemoteUserRankDataSource {
  @override
  Future<List<UserRankModel>> getUserRankings() async {
    try {
      var result = await http.get(Uri.parse("${baseUrl}users/rankings"));
      print("Response Body: ${result.body}");
      print('statusCode: ${result.statusCode}');
      if (result.statusCode == 200) {
        List<UserRankModel> rankings = [];
        var jsonResponse = jsonDecode(result.body);
        if (jsonResponse is List) {
          for (var rank in jsonResponse) {
            rankings.add(UserRankModel.fromJson(rank));
          }
          return rankings;
        } else {
          throw ServerException(
            errorMessageModel: ErrorMessageModel(
              message: "Unexpected response format",
              statusCode: result.statusCode,
              success: false,
            ),
          );
        }
      } else {
        throw ServerException(
          errorMessageModel: ErrorMessageModel(
            message: "Error occurred while getting user rankings from server",
            statusCode: result.statusCode,
            success: false,
          ),
        );
      }
    } catch (e) {
      print('Error: $e');
      throw ServerException(
        errorMessageModel: ErrorMessageModel(
          message: "Error occurred while getting user rankings: $e",
          statusCode: 400,
          success: false,
        ),
      );
    }
  }
}
