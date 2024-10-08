
import 'package:gammal_tech_final_exam/core/error/error_message_model.dart';

class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;

  const ServerException({required this.errorMessageModel});
}

class LocalException implements Exception {
  final String message;

  const LocalException({required this.message});
}
