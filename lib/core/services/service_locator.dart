import 'package:gammal_tech_final_exam/data/remote_data_source/remote_course_data_source.dart';
import 'package:gammal_tech_final_exam/data/remote_data_source/remote_topic_data_source.dart';
import 'package:gammal_tech_final_exam/data/repository/course_repository.dart';
import 'package:gammal_tech_final_exam/data/repository/topic_repository.dart';
import 'package:gammal_tech_final_exam/domain/repository/base_course_repository.dart';
import 'package:gammal_tech_final_exam/domain/repository/base_topic_repository.dart';
import 'package:gammal_tech_final_exam/domain/usecase/get_all_courses_usecase.dart';
import 'package:gammal_tech_final_exam/domain/usecase/get_course_suggestions_usecase.dart';
import 'package:gammal_tech_final_exam/domain/usecase/get_course_topics_by_id_usecase.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    sl.registerLazySingleton<GetAllCoursesUsecase>(
        () => GetAllCoursesUsecase(sl()));
    sl.registerLazySingleton<GetCourseSuggestionsUsecase>(
        () => GetCourseSuggestionsUsecase(sl()));
    sl.registerLazySingleton<GetCourseTopicsByIdUsecase>(
        () => GetCourseTopicsByIdUsecase(sl()));
    sl.registerLazySingleton<BaseTopicRepository>(() => TopicRepository(sl()));
    sl.registerLazySingleton<BaseCourseRepository>(
        () => CourseRepository(sl()));
    sl.registerLazySingleton<BaseRemoteTopicDataSource>(
        () => RemoteTopicDataSource());
    sl.registerLazySingleton<BaseRemoteCourseDataSource>(
        () => RemoteCourseDataSource());
  }
}
