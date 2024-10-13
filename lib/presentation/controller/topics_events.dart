import 'package:equatable/equatable.dart';

class TopicsEvents extends Equatable {
  const TopicsEvents();

  @override
  List<Object?> get props => [];
}

class FetchTopicsEvent extends TopicsEvents {
  final String courseId;
  const FetchTopicsEvent({required this.courseId});
}
class FetchSuggestedTopicsEvent extends TopicsEvents {}
