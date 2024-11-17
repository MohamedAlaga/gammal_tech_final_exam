///this file contains the service locator class to register all the services and dependencies
///[init] initialize the service locator
///[sl] get the instance of the service locator
///[ServiceLocator] service locator class to register all the services and dependencies
///[GetIt] get the instance of the service locator
library;

import 'package:gammal_tech_final_exam/data/remote_data_source/remote_course_data_source.dart';
import 'package:gammal_tech_final_exam/data/remote_data_source/remote_history_data_source.dart';
import 'package:gammal_tech_final_exam/data/remote_data_source/remote_topic_data_source.dart';
import 'package:gammal_tech_final_exam/data/remote_data_source/remote_user_data_source.dart';
import 'package:gammal_tech_final_exam/data/remote_data_source/remote_user_rank_data_source.dart';
import 'package:gammal_tech_final_exam/data/repository/course_repository.dart';
import 'package:gammal_tech_final_exam/data/repository/history_repositry.dart';
import 'package:gammal_tech_final_exam/data/repository/topic_repository.dart';
import 'package:gammal_tech_final_exam/data/repository/user_rank_repositry.dart';
import 'package:gammal_tech_final_exam/data/repository/user_repository.dart';
import 'package:gammal_tech_final_exam/domain/repository/base_course_repository.dart';
import 'package:gammal_tech_final_exam/domain/repository/base_history_repository.dart';
import 'package:gammal_tech_final_exam/domain/repository/base_topic_repository.dart';
import 'package:gammal_tech_final_exam/domain/repository/base_user_rank_repository.dart';
import 'package:gammal_tech_final_exam/domain/repository/base_user_repository.dart';
import 'package:gammal_tech_final_exam/domain/usecase/check_user_attempts_usecase.dart';
import 'package:gammal_tech_final_exam/domain/usecase/enroll_to_course_usecase.dart';
import 'package:gammal_tech_final_exam/domain/usecase/get_all_courses_usecase.dart';
import 'package:gammal_tech_final_exam/domain/usecase/get_course_suggestions_usecase.dart';
import 'package:gammal_tech_final_exam/domain/usecase/get_course_topics_by_id_usecase.dart';
import 'package:gammal_tech_final_exam/domain/usecase/get_topic_questions_usecase.dart';
import 'package:gammal_tech_final_exam/domain/usecase/get_up_next_topic_data_usecase.dart';
import 'package:gammal_tech_final_exam/domain/usecase/get_user_history_usecase.dart';
import 'package:gammal_tech_final_exam/domain/usecase/get_user_payment_info_usecase.dart';
import 'package:gammal_tech_final_exam/domain/usecase/get_user_profile_data_usecase.dart';
import 'package:gammal_tech_final_exam/domain/usecase/get_user_rank_data_usecase.dart';
import 'package:gammal_tech_final_exam/domain/usecase/get_user_welcome_data_usecase.dart';
import 'package:gammal_tech_final_exam/domain/usecase/login_user_usecase.dart';
import 'package:gammal_tech_final_exam/domain/usecase/record_user_payment_info_usecase.dart';
import 'package:gammal_tech_final_exam/domain/usecase/reset_password_request_usecase.dart';
import 'package:gammal_tech_final_exam/domain/usecase/reset_password_usecase.dart';
import 'package:gammal_tech_final_exam/domain/usecase/save_answer_usecase.dart';
import 'package:gammal_tech_final_exam/domain/usecase/signup_user_usecase.dart';
import 'package:gammal_tech_final_exam/domain/usecase/subtract_user_attempt_usecase.dart';
import 'package:gammal_tech_final_exam/domain/usecase/update_image_usecase.dart';
import 'package:gammal_tech_final_exam/domain/usecase/update_user_data_usecase.dart';
import 'package:gammal_tech_final_exam/domain/usecase/validate_user_token_usecase.dart';
import 'package:gammal_tech_final_exam/domain/usecase/verify_otp_usecase.dart';
import 'package:gammal_tech_final_exam/presentation/controller/courses_bloc.dart';
import 'package:gammal_tech_final_exam/presentation/controller/exams_bloc.dart';
import 'package:gammal_tech_final_exam/presentation/controller/log_bloc.dart';
import 'package:gammal_tech_final_exam/presentation/controller/payment_bloc.dart';
import 'package:gammal_tech_final_exam/presentation/controller/rank_bloc.dart';
import 'package:gammal_tech_final_exam/presentation/controller/reset_pass_bloc.dart';
import 'package:gammal_tech_final_exam/presentation/controller/signup_bloc.dart';
import 'package:gammal_tech_final_exam/presentation/controller/topics_bloc.dart';
import 'package:gammal_tech_final_exam/presentation/controller/user_bloc.dart';
import 'package:gammal_tech_final_exam/presentation/controller/user_profile_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../domain/usecase/get_user_cards_manager_info_usecase.dart';

final GetIt sl = GetIt.instance;

/// Service locator class to register all the services and dependencies
class ServiceLocator {
  void init() {
    //blocs
    sl.registerFactory<SignupBloc>(() => SignupBloc(sl(), sl()));
    sl.registerFactory<PaymentBloc>(() => PaymentBloc(sl(), sl(), sl()));
    sl.registerFactory<ExamsBloc>(() => ExamsBloc(sl(), sl(), sl(), sl()));
    sl.registerFactory<TopicsBloc>(() => TopicsBloc(sl(), sl()));
    sl.registerFactory<CoursesBloc>(() => CoursesBloc(sl(), sl(), sl()));
    sl.registerFactory<UserBloc>(() => UserBloc(sl(), sl(), sl()));
    sl.registerFactory<UserRankBloc>(() => UserRankBloc(sl()));
    sl.registerFactory<UserProfileBloc>(
        () => UserProfileBloc(sl(), sl(), sl()));
    sl.registerFactory<LogBloc>(() => LogBloc(sl()));
    sl.registerFactory<ResetPassBloc>(() => ResetPassBloc(sl(), sl(), sl()));
    //usecases
    sl.registerLazySingleton<UpdateImageUsecase>(
        () => UpdateImageUsecase(sl()));
    sl.registerLazySingleton<VerifyOtpUsecase>(() => VerifyOtpUsecase(sl()));
    sl.registerLazySingleton<ResetPasswordRequestUsecase>(
        () => ResetPasswordRequestUsecase(sl()));
    sl.registerLazySingleton<ResetPasswordUsecase>(
        () => ResetPasswordUsecase(sl()));
    sl.registerLazySingleton<SignupUserUsecase>(() => SignupUserUsecase(sl()));
    sl.registerLazySingleton<SubtractUserAttemptUsecase>(
        () => SubtractUserAttemptUsecase(sl()));
    sl.registerLazySingleton<CheckUserAttemptsUsecase>(
        () => CheckUserAttemptsUsecase(sl()));
    sl.registerLazySingleton<RecordUserPaymentInfoUsecase>(
        () => RecordUserPaymentInfoUsecase(sl()));
    sl.registerLazySingleton<GetUserCardsManagerInfoUsecase>(
        () => GetUserCardsManagerInfoUsecase(sl()));
    sl.registerLazySingleton<GetUserHistoryUsecase>(
        () => GetUserHistoryUsecase(sl()));
    sl.registerLazySingleton<GetUserProfileDataUsecase>(
        () => GetUserProfileDataUsecase(sl()));
    sl.registerLazySingleton<UpdateUserDataUsecase>(
        () => UpdateUserDataUsecase(sl()));
    sl.registerLazySingleton<GetUserPaymentInfoUsecase>(
        () => GetUserPaymentInfoUsecase(sl()));
    sl.registerLazySingleton<SaveAnswerUsecase>(() => SaveAnswerUsecase(sl()));
    sl.registerLazySingleton<GetTopicQuestionsUsecase>(
        () => GetTopicQuestionsUsecase(sl()));
    sl.registerLazySingleton<EnrollToCourseUsecase>(
        () => EnrollToCourseUsecase(sl()));
    sl.registerLazySingleton<GetUpNextTopicDataUsecase>(
        () => GetUpNextTopicDataUsecase(sl()));
    sl.registerLazySingleton<ValidateUserTokenUsecase>(
        () => ValidateUserTokenUsecase(sl()));
    sl.registerLazySingleton<GetAllCoursesUsecase>(
        () => GetAllCoursesUsecase(sl()));
    sl.registerLazySingleton<GetCourseSuggestionsUsecase>(
        () => GetCourseSuggestionsUsecase(sl()));
    sl.registerLazySingleton<GetCourseTopicsByIdUsecase>(
        () => GetCourseTopicsByIdUsecase(sl()));
    sl.registerLazySingleton<LoginUserUsecase>(() => LoginUserUsecase(sl()));
    sl.registerLazySingleton<GetUserWelcomeDataUsecase>(
        () => GetUserWelcomeDataUsecase(sl()));
    sl.registerLazySingleton<GetUserRankUsecase>(
        () => GetUserRankUsecase(sl()));
    //repositories
    sl.registerLazySingleton<BaseTopicRepository>(() => TopicRepository(sl()));
    sl.registerLazySingleton<BaseCourseRepository>(
        () => CourseRepository(sl()));
    sl.registerLazySingleton<BaseUserRepository>(() => UserRepository(sl()));
    sl.registerLazySingleton<BaseUserRankRepository>(
        () => UserRankRepository(sl()));
    sl.registerLazySingleton<BaseHistoryRepository>(
        () => HistoryRepositry(sl()));
    //data sources
    sl.registerLazySingleton<BaseRemoteHistoryDataSource>(
        () => RemoteHistoryDataSource());
    sl.registerLazySingleton<BaseRemoteTopicDataSource>(
        () => RemoteTopicDataSource());
    sl.registerLazySingleton<BaseRemoteCourseDataSource>(
        () => RemoteCourseDataSource());
    sl.registerLazySingleton<BaseRemoteUserDataSource>(
        () => RemoteUserDataSource());
    sl.registerLazySingleton<BaseRemoteUserRankDataSource>(
        () => RemoteUserRankDataSource());
  }
}
