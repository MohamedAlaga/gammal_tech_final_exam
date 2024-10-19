import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gammal_tech_final_exam/core/utils/enums.dart';
import 'package:gammal_tech_final_exam/data/models/topic_model.dart';
import 'package:gammal_tech_final_exam/domain/usecase/get_course_topics_by_id_usecase.dart';
import 'package:gammal_tech_final_exam/domain/usecase/get_up_next_topic_data_usecase.dart';
import 'package:gammal_tech_final_exam/presentation/controller/topics_events.dart';
import 'package:gammal_tech_final_exam/presentation/controller/topics_state.dart';

class TopicsBloc extends Bloc<TopicsEvents, TopicsState> {
  final GetCourseTopicsByIdUsecase getCourseTopicsByIdUsecase;
  final GetUpNextTopicDataUsecase getUpNextTopicDataUsecase;
  TopicsBloc(this.getCourseTopicsByIdUsecase, this.getUpNextTopicDataUsecase)
      : super(const TopicsState()) {
    on<FetchTopicsEvent>((event, emit) async {
      final result =
          await getCourseTopicsByIdUsecase.execute(event.courseId.toString());
      result.fold(
          (l) => emit(state.copyWith(
              sugesstedRequestState: RequestState.error,
              topicsErrorMessage: l.message)),
          (r) => emit(state.copyWith(
                topicsRequestState: RequestState.loaded,
                topics: r,
              )));
    });
    on<FetchSuggestedTopicsEvent>((event, emit) async {
      final result = await getUpNextTopicDataUsecase.execute();
      result.fold(
          (l) => emit(state.copyWith(
              sugesstedRequestState: RequestState.error,
              sugesstedErrorMessage: l.message)),
          (r) => emit(state.copyWith(
                sugesstedRequestState: RequestState.loaded,
                sugesstedTopics: r,
              )));
    });
    on<SetNextTopicEvent>((event, emit) {
      var tempList = state.topics;
      var nextTopic =
          tempList.where((element) => element.isCompleted == false).first;
      int index =
          state.topics.indexWhere((element) => element.isCompleted == false);
      if (index != -1) {
        state.topics[index] = TopicModel(
            id: nextTopic.id,
            courseId: nextTopic.courseId,
            duration: nextTopic.duration,
            title: nextTopic.title,
            subtitle: nextTopic.subtitle,
            description: nextTopic.description,
            imageUrl: nextTopic.imageUrl,
            skills: nextTopic.skills,
            points: nextTopic.points,
            quizCount: nextTopic.quizCount,
            isCompleted: true);
      }
      index =
          state.topics.indexWhere((element) => element.isCompleted == false);
    });
  }
}
