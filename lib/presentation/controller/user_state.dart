import 'package:equatable/equatable.dart';
import 'package:gammal_tech_final_exam/core/utils/enums.dart';
import 'package:gammal_tech_final_exam/domain/entities/welcome_data.dart';

class UserState extends Equatable {
  final WelcomeData welcomeData;
  final String userid;
  final RequestState loginRequestState;
  final String loginErrorMessage;
  final RequestState welcomeRequestState;
  final String welcomeErrorMessage;

  const UserState({
    this.welcomeData = const WelcomeData(
      imageUrl: "https://i.imgur.com/SItobeV.png",
      points: 0,
      rank: 0,
      solvedExams: 0,
      title: "user",
      totalRanks: 0,
    ),
    this.userid = "",
    this.loginErrorMessage = "",
    this.loginRequestState = RequestState.loading,
    this.welcomeRequestState = RequestState.loading,
    this.welcomeErrorMessage = "",
  });

  UserState copyWith({
    WelcomeData? welcomeData,
    String? userid,
    RequestState? loginRequestState,
    String? loginErrorMessage,
    RequestState? welcomeRequestState,
    String? welcomeErrorMessage,
  }) {
    return UserState(
      welcomeData: welcomeData ?? this.welcomeData,
      userid: userid ?? this.userid,
      loginRequestState: loginRequestState ?? this.loginRequestState,
      loginErrorMessage: loginErrorMessage ?? this.loginErrorMessage,
      welcomeRequestState: welcomeRequestState ?? this.welcomeRequestState,
      welcomeErrorMessage: welcomeErrorMessage ?? this.welcomeErrorMessage,
    );
  }

  @override
  List<Object?> get props => [
        welcomeData,
        userid,
        loginRequestState,
        loginErrorMessage,
        welcomeRequestState,
        welcomeErrorMessage,
      ];
}
