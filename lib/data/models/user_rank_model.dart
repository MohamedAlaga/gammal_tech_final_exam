import 'package:gammal_tech_final_exam/domain/entities/user_rank.dart';

class UserRankModel extends UserRank {
  const UserRankModel({
    required String name,
    required String college,
    required int points,
    required String imageUrl,
  }) : super(
          name: name,
          college: college,
          points: points,
          imageUrl: imageUrl,
        );

  factory UserRankModel.fromJson(Map<String, dynamic> json) {
    return UserRankModel(
      name: json['name'] ?? 'Gammal tech user',
      college: json['college'] ?? 'college...',
      points: json['total_points'] ?? 0,
      imageUrl: json['imageUrl'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "college": college,
      "total_points": points,
      "imageUrl": imageUrl,
    };
  }
}
