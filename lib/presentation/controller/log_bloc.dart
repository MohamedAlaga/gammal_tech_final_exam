import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gammal_tech_final_exam/core/utils/enums.dart';
import 'package:gammal_tech_final_exam/domain/usecase/get_user_history_usecase.dart';
import 'package:gammal_tech_final_exam/presentation/controller/log_events.dart';
import 'package:gammal_tech_final_exam/presentation/controller/log_state.dart';

class LogBloc extends Bloc<LogEvents, LogState> {
  final GetUserHistoryUsecase getUserHistoryUsecase;
  LogBloc(this.getUserHistoryUsecase) : super(const LogState()) {
    on<FetchLogEvent>((event, emit) async {
      var result = await getUserHistoryUsecase.execute();
      result.fold(
        (l) => emit(LogState(
            requestState: RequestState.error, errorMessage: l.message)),
        (r) => emit(LogState(
          requestState: RequestState.loaded,
          userLogs: r,
        )),
      );
    });
  }
}
