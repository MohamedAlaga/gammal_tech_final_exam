import 'package:equatable/equatable.dart';
import 'package:gammal_tech_final_exam/core/utils/enums.dart';
import 'package:gammal_tech_final_exam/domain/entities/course.dart';

class SuggestedCoursesState extends Equatable {
  final List<Course> suggestedCourses;
  final RequestState suggestedCoursesRequestState;
  final String suggestedCoursesErrorMessage;

  const SuggestedCoursesState({
    this.suggestedCourses = const [],
    this.suggestedCoursesRequestState = RequestState.loading,
    this.suggestedCoursesErrorMessage = "",
  });

  @override
  List<Object?> get props => [
        suggestedCourses,
        suggestedCoursesRequestState,
        suggestedCoursesErrorMessage
      ];
}
