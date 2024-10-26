///this file contains models to handle error messages
library;

///class to handel error message
///[message] error message
///[statusCode] status code of the error
///[success] status of the error
///
///example (if error 404 happens in a request)
///```dart
///ErrorMessageModel(
///  message: "file not found",
/// statusCode: 404,
/// success: false,
/// )
class ErrorMessageModel {
  final String message;
  final int statusCode;
  final bool success;

  const ErrorMessageModel({
    required this.message,
    required this.statusCode,
    required this.success,
  });

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return ErrorMessageModel(
      message: json['message'],
      statusCode: json['status_code'],
      success: json['success'],
    );
  }
}
