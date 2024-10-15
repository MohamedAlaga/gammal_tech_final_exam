import 'package:equatable/equatable.dart';

abstract class UserRankEvent extends Equatable {
  const UserRankEvent();

  @override
  List<Object> get props => [];
}

class GetUserRankEvent extends UserRankEvent {
  const GetUserRankEvent();

  @override
  List<Object> get props => [];
}
