import 'package:gammal_tech_final_exam/domain/entities/welcome_data.dart';

class WelcomeDataModel extends WelcomeData {
  const WelcomeDataModel(
      {required super.title,
      required super.imageUrl,
      required super.solvedExams,
      required super.points,
      required super.totalRanks,
      required super.rank});

  factory WelcomeDataModel.fromJson(Map<String, dynamic> json) {
    return WelcomeDataModel(
      title: json['name'],
      imageUrl: json['imageUrl'] ?? "",
      solvedExams: json['finished_exams'],
      points: json['total_points'],
      totalRanks: json['total_ranks'],
      rank: json['rank'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': super.title,
      'imageUrl': super.imageUrl,
      'solvedExams': super.solvedExams,
      'points': super.points,
      'totalRanks': super.totalRanks,
      'rank': super.rank,
    };
  }
}
