import 'package:equatable/equatable.dart';

class UserLog extends Equatable {
  final List<String> description;
  final String imageUrl;
  final String dateTime;

  const UserLog({
    required this.description,
    required this.imageUrl,
    required this.dateTime,
  });

  @override
  List<Object?> get props => [description, imageUrl, dateTime];
}
