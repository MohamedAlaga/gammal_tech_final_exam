import 'package:gammal_tech_final_exam/domain/entities/user_log.dart';

class UserLogModel extends UserLog {
  const UserLogModel({
    required super.dateTime,
    required super.description,
    required super.imageUrl,
    required super.operationName,
  });

  factory UserLogModel.fromJson(Map<String, dynamic> json) {
    return UserLogModel(
      dateTime: json['dateTime'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      operationName: json['operationName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dateTime': dateTime,
      'description': description,
      'imageUrl': imageUrl,
      'operationName': operationName,
    };
  }
}
