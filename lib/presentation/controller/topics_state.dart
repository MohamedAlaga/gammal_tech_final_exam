import 'package:equatable/equatable.dart';
import 'package:gammal_tech_final_exam/core/utils/enums.dart';
import 'package:gammal_tech_final_exam/domain/entities/topic.dart';

class TopicsState extends Equatable {
  final List<Topic> topics;
  final RequestState topicsRequestState;
  final String topicsErrorMessage;
  final List<Topic> sugesstedTopics;
  final RequestState sugesstedRequestState;
  final String sugesstedErrorMessage;

  const TopicsState({
    this.topics = const [],
    this.topicsRequestState = RequestState.loading,
    this.topicsErrorMessage = "",
    this.sugesstedTopics = const [],
    this.sugesstedRequestState = RequestState.loading,
    this.sugesstedErrorMessage = "",
  });

  TopicsState copyWith({
    List<Topic>? topics,
    RequestState? topicsRequestState,
    String? topicsErrorMessage,
    List<Topic>? sugesstedTopics,
    RequestState? sugesstedRequestState,
    String? sugesstedErrorMessage,
  }) {
    return TopicsState(
      topics: topics ?? this.topics,
      topicsRequestState: topicsRequestState ?? this.topicsRequestState,
      topicsErrorMessage: topicsErrorMessage ?? this.topicsErrorMessage,
      sugesstedTopics: sugesstedTopics ?? this.sugesstedTopics,
      sugesstedRequestState:
          sugesstedRequestState ?? this.sugesstedRequestState,
      sugesstedErrorMessage:
          sugesstedErrorMessage ?? this.sugesstedErrorMessage,
    );
  }

  @override
  List<Object?> get props => [
        topics,
        topicsRequestState,
        topicsErrorMessage,
        sugesstedTopics,
        sugesstedRequestState,
        sugesstedErrorMessage,
      ];
}
