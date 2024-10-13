import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gammal_tech_final_exam/core/utils/enums.dart';
import 'package:gammal_tech_final_exam/domain/usecase/enroll_to_course_usecase.dart';
import 'package:gammal_tech_final_exam/domain/usecase/get_all_courses_usecase.dart';
import 'package:gammal_tech_final_exam/domain/usecase/get_course_suggestions_usecase.dart';
import 'package:gammal_tech_final_exam/presentation/controller/courses_state.dart';
import 'package:gammal_tech_final_exam/presentation/controller/courses_events.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CoursesBloc extends Bloc<CoursesEvents, CoursesState> {
  final GetAllCoursesUsecase getAllCoursesUsecase;
  final GetCourseSuggestionsUsecase getCourseSuggestionsUsecase;
  final EnrollToCourseUsecase enrollToCourseUsecase;
  CoursesBloc(this.getAllCoursesUsecase, this.getCourseSuggestionsUsecase,
      this.enrollToCourseUsecase)
      : super(const CoursesState()) {
    on<FetchAllCoursesEvent>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final result = await getAllCoursesUsecase
          .execute(prefs.getString("userid").toString());
      result.fold(
          (l) => emit(state.copyWith(
              allCoursesRequestState: RequestState.error,
              allCoursesErrorMessage: l.message)),
          (r) => emit(state.copyWith(
                allCoursesRequestState: RequestState.loaded,
                allCourses: r,
              )));
    });
    on<FetchSuggestedCoursesEvent>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final result = await getCourseSuggestionsUsecase
          .execute(prefs.getString("userid").toString());
      result.fold(
          (l) => emit(state.copyWith(
              suggestedCoursesRequestState: RequestState.error,
              suggestedCoursesErrorMessage: l.message)),
          (r) => emit(state.copyWith(
                suggestedCoursesRequestState: RequestState.loaded,
                suggestedCourses: r,
              )));
    });
    on<EnrollToCourseEvent>((event, emit) async {
      await enrollToCourseUsecase.execute(event.courseId);
    });
  }
}
