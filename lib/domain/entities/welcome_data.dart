/// this file conatins the welcome data entity
library;

import 'package:equatable/equatable.dart';

/// class to handel welcome data
/// [title] welcome title
/// [imageUrl] welcome image url
/// [rank] user rank
/// [solvedExams] user solved exams
/// [points] user points
/// [totalRanks] total ranks
class WelcomeData extends Equatable {
  final String title;
  final String imageUrl;
  final int rank;
  final int solvedExams;
  final int points;
  final int totalRanks;

  const WelcomeData(
      {required this.title,
      required this.imageUrl,
      required this.solvedExams,
      required this.points,
      required this.totalRanks,
      required this.rank});

  @override
  List<Object?> get props =>
      [title, imageUrl, solvedExams, points, totalRanks, rank];
}
