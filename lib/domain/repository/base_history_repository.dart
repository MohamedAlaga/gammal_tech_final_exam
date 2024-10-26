/// This file contains the abstract class [BaseHistoryRepository] that is used to define the methods that should be implemented in the data layer to get the history data from the server.
library;

import 'package:dartz/dartz.dart';
import 'package:gammal_tech_final_exam/core/error/faliure.dart';
import 'package:gammal_tech_final_exam/domain/entities/user_log.dart';

/// [BaseHistoryRepository] abstract class to define the methods that should be implemented in the data layer to get the history data from the server.
abstract class BaseHistoryRepository {
  Future<Either<Failure, List<UserLog>>> getHistory();
}
