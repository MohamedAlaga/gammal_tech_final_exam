import 'package:gammal_tech_final_exam/domain/entities/user_log.dart';
import 'package:intl/intl.dart';

class UserLogModel extends UserLog {
  const UserLogModel({
    required super.dateTime,
    required super.description,
    required super.imageUrl,
  });

  factory UserLogModel.fromJson(Map<String, dynamic> json) {
    DateTime dateTime = DateTime.parse(json['attempt_date']);
    double score =json["score"] / 6 *100 ;
    List<String> temp = [];
    temp.add(json["CourseQuiz"]["quiz_name"].toString());
    temp.add(
        "Result: ${score.round()}%");
    return UserLogModel(
      dateTime:
          "${DateFormat('yyyy-MM-dd').format(dateTime)}, ${DateFormat('h:mm a').format(dateTime)}",
      description: temp,
      imageUrl: json['imageUrl'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dateTime': dateTime,
      'description': description,
      'imageUrl': imageUrl,
    };
  }
}
