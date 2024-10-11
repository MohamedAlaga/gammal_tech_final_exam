import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gammal_tech_final_exam/core/utils/enums.dart';
import 'package:gammal_tech_final_exam/domain/usecase/get_course_suggestions_usecase.dart';
import 'package:gammal_tech_final_exam/presentation/controller/suggested_courses_events.dart';
import 'package:gammal_tech_final_exam/presentation/controller/suggested_courses_state.dart';

class AllCoursesBloc
    extends Bloc<SuggestedCoursesEvents, SuggestedCoursesState> {
  final GetCourseSuggestionsUsecase getCourseSuggestionsUsecase;
  AllCoursesBloc(this.getCourseSuggestionsUsecase)
      : super(const SuggestedCoursesState()) {
    on<FetchSuggestedCoursesEvent>((event, emit) async {
      final result = await getCourseSuggestionsUsecase.execute("1");
      result.fold(
          (l) => emit(SuggestedCoursesState(
              suggestedCoursesRequestState: RequestState.error,
              suggestedCoursesErrorMessage: l.message)),
          (r) => SuggestedCoursesState(
                suggestedCoursesRequestState: RequestState.loaded,
                suggestedCourses: r,
              ));
    });
  }
}
