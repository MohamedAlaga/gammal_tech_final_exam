import 'package:equatable/equatable.dart';
import 'package:gammal_tech_final_exam/core/utils/enums.dart';
import 'package:gammal_tech_final_exam/domain/entities/course.dart';

class AllCoursesState extends Equatable {
  final List<Course> allCourses;
  final RequestState allCoursesRequestState;
  final String allCoursesErrorMessage;

  const AllCoursesState({
    this.allCourses = const [],
    this.allCoursesRequestState = RequestState.loading,
    this.allCoursesErrorMessage = "",
  });

  @override
  List<Object?> get props =>
      [allCourses, allCoursesRequestState, allCoursesErrorMessage];
}
