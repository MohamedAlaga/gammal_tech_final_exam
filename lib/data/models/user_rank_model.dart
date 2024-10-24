/// The model class is used to convert the Topic json data to the entity object and vice versa.
library;

import 'package:gammal_tech_final_exam/domain/entities/user_rank.dart';

/// class to convert UserRank json data to dart object and vice versa
class UserRankModel extends UserRank {
  const UserRankModel({
    required super.name,
    required super.points,
    required super.state,
  });

  /// convert json data to dart object
  factory UserRankModel.fromJson(Map<String, dynamic> json) {
    return UserRankModel(
      name: json['name'] ?? 'Gammal tech user',
      points: json['total_points'] ?? 0,
      state: json['state'] ?? '',
    );
  }

  /// convert dart object to json data
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "total_points": points,
      "state": state,
    };
  }
}
