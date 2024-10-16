import 'package:equatable/equatable.dart';
import 'package:gammal_tech_final_exam/core/utils/enums.dart';
import 'package:gammal_tech_final_exam/domain/entities/user_log.dart';

class LogState extends Equatable {
  final List<UserLog> userLogs;
  final RequestState requestState;
  final String errorMessage;

  const LogState({
    this.userLogs = const [],
    this.requestState = RequestState.loading,
    this.errorMessage = "",
  });

  @override
  List<Object?> get props => [userLogs, requestState, errorMessage];
}
