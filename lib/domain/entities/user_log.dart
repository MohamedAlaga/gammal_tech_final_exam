import 'package:equatable/equatable.dart';

class UserLog extends Equatable {
  final String operationName;
  final List<String> description;
  final String imageUrl;
  final String dateTime;

  const UserLog({
    required this.operationName,
    required this.description,
    required this.imageUrl,
    required this.dateTime,
  });

  @override
  List<Object?> get props => [operationName, description, imageUrl, dateTime];
}
