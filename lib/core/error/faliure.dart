/// This file contains all the failure classes that can be thrown by the application.
library;

/// Failure base class to handle errot thrown by the application
abstract class Failure {
  final String message;
  const Failure(this.message);
}

/// Custom failure for server error
class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

/// Custom failure for database error
class DatabaseFailure extends Failure {
  const DatabaseFailure(super.message);
}
