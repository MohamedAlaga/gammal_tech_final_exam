/// this file contains the remote data source for user rank
library;

import 'dart:convert';

import 'package:gammal_tech_final_exam/core/error/error_message_model.dart';
import 'package:gammal_tech_final_exam/core/error/exceptions.dart';
import 'package:gammal_tech_final_exam/data/models/user_rank_model.dart';
import 'package:gammal_tech_final_exam/domain/entities/user_rank.dart';
import 'package:http/http.dart' as http;

import '../../core/utils/env.dart';

/// base class for the remote user rank data source
abstract class BaseRemoteUserRankDataSource {
  Future<List<UserRank>> getUserRankings();
}

/// RemoteUserRankDataSource class is responsible for handling all the remote data sources for the user rank entity.
class RemoteUserRankDataSource extends BaseRemoteUserRankDataSource {
  @override

  /// get user rankings from the server
  /// on success : return list of user rankings
  /// on failure : throw ServerException contains the error message and code
  Future<List<UserRankModel>> getUserRankings() async {
    try {
      var result = await http.get(Uri.parse("${baseUrl}users/rankings"));
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
