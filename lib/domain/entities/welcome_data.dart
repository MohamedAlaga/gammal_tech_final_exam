import 'package:equatable/equatable.dart';

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
