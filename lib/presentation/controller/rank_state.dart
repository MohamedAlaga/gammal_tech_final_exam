import 'package:equatable/equatable.dart';
import 'package:gammal_tech_final_exam/core/utils/enums.dart';
import 'package:gammal_tech_final_exam/domain/entities/user_rank.dart';

class UserRankState extends Equatable {
  final List<UserRank> userRankings;
  final RequestState userRankingsRequestState;
  final String userRankingsErrorMessage;
  final List<UserRank> topRankings;
  final RequestState topRankingsRequestState;
  final String topRankingsErrorMessage;

  const UserRankState({
    this.userRankings = const [],
    this.userRankingsRequestState = RequestState.loading,
    this.userRankingsErrorMessage = "",
    this.topRankings = const [],
    this.topRankingsRequestState = RequestState.loading,
    this.topRankingsErrorMessage = "",
  });

  UserRankState copyWith({
    List<UserRank>? userRankings,
    RequestState? userRankingsRequestState,
    String? userRankingsErrorMessage,
    List<UserRank>? topRankings,
    RequestState? topRankingsRequestState,
    String? topRankingsErrorMessage,
  }) {
    return UserRankState(
      userRankings: userRankings ?? this.userRankings,
      userRankingsRequestState:
          userRankingsRequestState ?? this.userRankingsRequestState,
      userRankingsErrorMessage:
          userRankingsErrorMessage ?? this.userRankingsErrorMessage,
      topRankings: topRankings ?? this.topRankings,
      topRankingsRequestState:
          topRankingsRequestState ?? this.topRankingsRequestState,
      topRankingsErrorMessage:
          topRankingsErrorMessage ?? this.topRankingsErrorMessage,
    );
  }

  @override
  List<Object?> get props => [
        userRankings,
        userRankingsRequestState,
        userRankingsErrorMessage,
        topRankings,
        topRankingsRequestState,
        topRankingsErrorMessage,
      ];
}
