import 'package:equatable/equatable.dart';
import 'package:gammal_tech_final_exam/core/utils/enums.dart';
import 'package:gammal_tech_final_exam/domain/entities/user.dart';

class UserProfileState extends Equatable {
  final User currentUser;
  final String errorMessage;
  final RequestState requestState;

  const UserProfileState({
    this.currentUser = const User(
        name: "",
        attemptsRemaining: 0,
        email: "",
        imageUrl: "",
        totalPoints: 0,
        bio: "",
        collegeName: "",
        phone: "",
        progress: {},
        skills: []),
    this.errorMessage = "",
    this.requestState = RequestState.loading,
  });

  UserProfileState copyWith({
    User? currentUser,
    String? errorMessage,
    RequestState? requestState,
  }) {
    return UserProfileState(
      currentUser: currentUser ?? this.currentUser,
      errorMessage: errorMessage ?? this.errorMessage,
      requestState: requestState ?? this.requestState,
    );
  }

  @override
  List<Object?> get props => [currentUser, errorMessage, requestState];
}
