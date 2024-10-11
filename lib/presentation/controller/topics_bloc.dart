import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gammal_tech_final_exam/core/utils/enums.dart';
import 'package:gammal_tech_final_exam/domain/usecase/get_course_topics_by_id_usecase.dart';
import 'package:gammal_tech_final_exam/presentation/controller/topics_events.dart';
import 'package:gammal_tech_final_exam/presentation/controller/topics_state.dart';

class TopicsBloc extends Bloc<TopicsEvents, TopicsState> {
  final GetCourseTopicsByIdUsecase getCourseTopicsByIdUsecase;
  TopicsBloc(this.getCourseTopicsByIdUsecase) : super(const TopicsState()) {
    on<FetchTopicsEvent>((event, emit) async {
      final result = await getCourseTopicsByIdUsecase.execute("1","1");
      result.fold(
          (l) => emit(TopicsState(
              topicsRequestState: RequestState.error,
              topicsErrorMessage: l.message)),
          (r) => TopicsState(
                topicsRequestState: RequestState.loaded,
                topics: r,
              ));
    });
  }
}
