import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gammal_tech_final_exam/core/utils/enums.dart';
import 'package:gammal_tech_final_exam/domain/usecase/get_all_courses_usecase.dart';
import 'package:gammal_tech_final_exam/presentation/controller/all_courses_state.dart';
import 'package:gammal_tech_final_exam/presentation/controller/all_courses_events.dart';

class AllCoursesBloc extends Bloc<AllCoursesEvents, AllCoursesState> {
  final GetAllCoursesUsecase getAllCoursesUsecase;
  AllCoursesBloc(this.getAllCoursesUsecase) : super(const AllCoursesState()) {
    on<FetchAllCoursesEvent>((event, emit) async {
      final result = await getAllCoursesUsecase.execute("1");
      result.fold(
          (l) => emit(AllCoursesState(
              allCoursesRequestState: RequestState.error,
              allCoursesErrorMessage: l.message)),
          (r) => emit(AllCoursesState(
                allCoursesRequestState: RequestState.loaded,
                allCourses: r,)));
    });
  }
}
