import 'package:equatable/equatable.dart';

class UserRank extends Equatable {
  final String name;
  final int points;
  final String state;

  const UserRank({
    required this.name,
    required this.points,
    required this.state,
  });

  @override
  List<Object?> get props => [name, points, state];
}
