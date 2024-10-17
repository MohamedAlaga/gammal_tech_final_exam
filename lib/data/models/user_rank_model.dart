import 'package:gammal_tech_final_exam/domain/entities/user_rank.dart';

class UserRankModel extends UserRank {
  const UserRankModel({
    required String name,
    required int points,
    required String state,
  }) : super(
          name: name,
          points: points,
          state: state,
        );

  factory UserRankModel.fromJson(Map<String, dynamic> json) {
    return UserRankModel(
      name: json['name'] ?? 'Gammal tech user',
      points: json['total_points'] ?? 0,
      state: json['state'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "total_points": points,
      "state": state,
    };
  }
}
