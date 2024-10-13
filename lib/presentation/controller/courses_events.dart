import 'package:equatable/equatable.dart';

class CoursesEvents extends Equatable{
  const CoursesEvents();

  @override
  List<Object?> get props => [];
}

class FetchAllCoursesEvent extends CoursesEvents {}
class FetchSuggestedCoursesEvent extends CoursesEvents {}
class EnrollToCourseEvent extends CoursesEvents {
  final String courseId;
  const EnrollToCourseEvent(this.courseId);
  @override
  List<Object?> get props => [courseId];
}