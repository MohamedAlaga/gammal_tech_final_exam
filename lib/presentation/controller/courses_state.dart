import 'package:equatable/equatable.dart';
import 'package:gammal_tech_final_exam/core/utils/enums.dart';
import 'package:gammal_tech_final_exam/domain/entities/course.dart';

class CoursesState extends Equatable {
  final List<Course> allCourses;
  final RequestState allCoursesRequestState;
  final String allCoursesErrorMessage;
  final List<Course> suggestedCourses;
  final RequestState suggestedCoursesRequestState;
  final String suggestedCoursesErrorMessage;
  

  const CoursesState({
    this.allCourses = const [],
    this.allCoursesRequestState = RequestState.loading,
    this.allCoursesErrorMessage = "",
    this.suggestedCourses = const [],
    this.suggestedCoursesRequestState = RequestState.loading,
    this.suggestedCoursesErrorMessage = "",
  });

  CoursesState copyWith({
    List<Course>? allCourses,
    RequestState? allCoursesRequestState,
    String? allCoursesErrorMessage,
    List<Course>? suggestedCourses,
    RequestState? suggestedCoursesRequestState,
    String? suggestedCoursesErrorMessage,
  }) {
    return CoursesState(
      allCourses: allCourses ?? this.allCourses,
      allCoursesRequestState: allCoursesRequestState ?? this.allCoursesRequestState,
      allCoursesErrorMessage: allCoursesErrorMessage ?? this.allCoursesErrorMessage,
      suggestedCourses: suggestedCourses ?? this.suggestedCourses,
      suggestedCoursesRequestState: suggestedCoursesRequestState ?? this.suggestedCoursesRequestState,
      suggestedCoursesErrorMessage: suggestedCoursesErrorMessage ?? this.suggestedCoursesErrorMessage,
    );
  }

  @override
  List<Object?> get props => [
        allCourses,
        allCoursesRequestState,
        allCoursesErrorMessage,
        suggestedCourses,
        suggestedCoursesRequestState,
        suggestedCoursesErrorMessage,
      ];
}
