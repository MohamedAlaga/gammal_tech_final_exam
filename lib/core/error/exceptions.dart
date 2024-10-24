/// custom exceptions for server and local errors
library;
import 'package:gammal_tech_final_exam/core/error/error_message_model.dart';

/// custom exception for server error
/// [errorMessageModel] error message model to handle the message displayed on the screen
/// 
/// example (if error 404 happens in a request)
/// ```dart
/// ServerException(
///  errorMessageModel: ErrorMessageModel(
///   message: "file not found",
///  statusCode: 404,
/// success: false,
/// )
class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;

  const ServerException({required this.errorMessageModel});
}

class LocalException implements Exception {
  final String message;

  const LocalException({required this.message});
}
