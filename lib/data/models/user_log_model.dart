/// The model class is used to convert the log json data to the entity object and vice versa.
library;

import 'package:gammal_tech_final_exam/domain/entities/user_log.dart';
import 'package:intl/intl.dart';

/// class to convert UserLog json data to dart object and vice versa
class UserLogModel extends UserLog {
  const UserLogModel({
    required super.dateTime,
    required super.description,
    required super.imageUrl,
  });
  /// convert json data to dart object
  factory UserLogModel.fromJson(Map<String, dynamic> json) {
    DateTime dateTime = DateTime.parse(json['attempt_date']);
    double score;
    if (json["percentage"] != null) {
      score = json["percentage"] == 0
          ? json["score"] / 6 * 100
          : double.parse(json["percentage"].toString());
    } else if (json["score"] != null) {
      score = json["score"] / 6 * 100;
    } else{
      score = 0;
    }
    List<String> temp = [];
    temp.add(json["CourseQuiz"]["quiz_name"].toString());
    temp.add("Result: ${score.round()}%");
    return UserLogModel(
      dateTime:
          "${DateFormat('yyyy-MM-dd').format(dateTime)}, ${DateFormat('h:mm a').format(dateTime)}",
      description: temp,
      imageUrl: json['imageUrl'] ?? "",
    );
  }
  /// convert dart object to json data
  Map<String, dynamic> toJson() {
    return {
      'dateTime': dateTime,
      'description': description,
      'imageUrl': imageUrl,
    };
  }
}
