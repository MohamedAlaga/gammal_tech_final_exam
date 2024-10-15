import 'package:equatable/equatable.dart';

class UserRank extends Equatable {
  final String name;
  final String college;
  final int points;
  final String imageUrl;

  const UserRank({
    required this.name,
    required this.college,
    required this.points,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [name, college, points, imageUrl];
}
