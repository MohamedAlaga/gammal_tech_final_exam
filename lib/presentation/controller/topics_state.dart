import 'package:equatable/equatable.dart';
import 'package:gammal_tech_final_exam/core/utils/enums.dart';
import 'package:gammal_tech_final_exam/domain/entities/topic.dart';

class TopicsState extends Equatable {
  final List<Topic> topics;
  final RequestState topicsRequestState;
  final String topicsErrorMessage;

  const TopicsState({
    this.topics = const [],
    this.topicsRequestState = RequestState.loading,
    this.topicsErrorMessage = "",
  });

  @override
  List<Object?> get props => [topics, topicsRequestState, topicsErrorMessage];
}
