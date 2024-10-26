/// this file contains user Log entity
library;

import 'package:equatable/equatable.dart';

///class to handel user log
///[description] log description
///[imageUrl] log image url
///[dateTime] log date time
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
