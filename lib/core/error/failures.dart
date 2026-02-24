import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure({required this.message, this.statusCode});

  final String message;
  final int? statusCode;

  @override
  List<Object?> get props => [message, statusCode];
}

// ─── Network Failures ─────────────────────────────────────────────────────────

class NoInternetFailure extends Failure {
  const NoInternetFailure({
    super.message = 'No internet connection. Please check your network.',
  });
}

class ConnectionTimeoutFailure extends Failure {
  const ConnectionTimeoutFailure({
    super.message = 'Connection timed out. Please try again.',
  });
}

class ReceiveTimeoutFailure extends Failure {
  const ReceiveTimeoutFailure({
    super.message = 'Server response timed out. Please try again.',
  });
}

// ─── HTTP Failures ────────────────────────────────────────────────────────────

class BadRequestFailure extends Failure {
  const BadRequestFailure({
    super.message = 'Bad request.',
    super.statusCode = 400,
  });
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure({
    super.message = 'Unauthorized. Please log in again.',
    super.statusCode = 401,
  });
}

class ForbiddenFailure extends Failure {
  const ForbiddenFailure({
    super.message = 'You do not have permission to perform this action.',
    super.statusCode = 403,
  });
}

class NotFoundFailure extends Failure {
  const NotFoundFailure({
    super.message = 'The requested resource was not found.',
    super.statusCode = 404,
  });
}

class ConflictFailure extends Failure {
  const ConflictFailure({
    super.message = 'A conflict occurred with the current state of the resource.',
    super.statusCode = 409,
  });
}

class UnprocessableEntityFailure extends Failure {
  const UnprocessableEntityFailure({
    super.message = 'The request data is invalid.',
    super.statusCode = 422,
  });
}

class ServerFailure extends Failure {
  const ServerFailure({
    super.message = 'An unexpected server error occurred.',
    super.statusCode,
  });
}

// ─── Auth Failures ────────────────────────────────────────────────────────────

class InvalidCredentialsFailure extends Failure {
  const InvalidCredentialsFailure({
    super.message = 'Invalid email or password.',
  });
}

class UserNotFoundFailure extends Failure {
  const UserNotFoundFailure({
    super.message = 'No account found with this email address.',
  });
}

class EmailAlreadyExistsFailure extends Failure {
  const EmailAlreadyExistsFailure({
    super.message = 'An account with this email address already exists.',
  });
}

class WeakPasswordFailure extends Failure {
  const WeakPasswordFailure({
    super.message =
        'Password is too weak. Use at least 8 characters with letters and numbers.',
  });
}

class InvalidResetTokenFailure extends Failure {
  const InvalidResetTokenFailure({
    super.message = 'Password reset link is invalid or has expired.',
  });
}

// ─── Cache / Storage Failures ─────────────────────────────────────────────────

class CacheReadFailure extends Failure {
  const CacheReadFailure({
    super.message = 'Failed to read data from local storage.',
  });
}

class CacheWriteFailure extends Failure {
  const CacheWriteFailure({
    super.message = 'Failed to write data to local storage.',
  });
}

class JsonParseFailure extends Failure {
  const JsonParseFailure({
    super.message = 'Failed to parse stored data. It may be corrupted.',
  });
}

class CacheFailure extends Failure {
  const CacheFailure({super.message = 'Cache error occurred.'});
}

// ─── Validation Failures ──────────────────────────────────────────────────────

class ValidationFailure extends Failure {
  const ValidationFailure({required super.message});
}

// ─── Auth Failure (generic kept for backward compat) ─────────────────────────

class AuthFailure extends Failure {
  const AuthFailure({super.message = 'Authentication failure occurred.'});
}

class NetworkFailure extends Failure {
  const NetworkFailure({super.message = 'Network failure occurred.'});
}
