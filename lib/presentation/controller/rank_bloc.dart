import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gammal_tech_final_exam/core/utils/enums.dart';
import 'package:gammal_tech_final_exam/presentation/controller/rank_event.dart';
import 'package:gammal_tech_final_exam/presentation/controller/rank_state.dart';

import '../../domain/usecase/get_user_rank_data_usecase.dart';

class UserRankBloc extends Bloc<UserRankEvent, UserRankState> {
  final GetUserRankUsecase getUserRankUsecase;

  UserRankBloc(this.getUserRankUsecase) : super(const UserRankState()) {
    on<GetUserRankEvent>((event, emit) async {
      emit(
        state.copyWith(
          userRankingsRequestState: RequestState.loading,
        ),
      );
      final result = await getUserRankUsecase.execute();
      result.fold(
        (failure) {
          emit(state.copyWith(
            userRankingsRequestState: RequestState.error,
            userRankingsErrorMessage: failure.message,
          ));
        },
        (userRanks) {
          emit(state.copyWith(
            userRankingsRequestState: RequestState.loaded,
            userRankings: userRanks,
          ));
        },
      );
    });
  }
}
