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