/// Base exception for the app. All custom exceptions extend this.
abstract class AppException implements Exception {
  const AppException({required this.message, this.statusCode});

  final String message;
  final int? statusCode;

  @override
  String toString() => '$runtimeType($statusCode): $message';
}

// ─── Network Exceptions ───────────────────────────────────────────────────────

/// Thrown when the device has no internet connection.
class NoInternetException extends AppException {
  const NoInternetException({
    super.message = 'No internet connection. Please check your network.',
  });
}

/// Thrown when a connection attempt times out.
class ConnectionTimeoutException extends AppException {
  const ConnectionTimeoutException({
    super.message = 'Connection timed out. Please try again.',
  });
}

/// Thrown when a response takes too long to arrive.
class ReceiveTimeoutException extends AppException {
  const ReceiveTimeoutException({
    super.message = 'Server response timed out. Please try again.',
  });
}

/// Thrown when an SSL/certificate error occurs.
class BadCertificateException extends AppException {
  const BadCertificateException({
    super.message = 'SSL certificate error.',
  });
}

// ─── HTTP Status Exceptions ───────────────────────────────────────────────────

/// 400 Bad Request
class BadRequestException extends AppException {
  const BadRequestException({
    super.message = 'Bad request.',
    super.statusCode = 400,
  });
}

/// 401 Unauthorized — token missing or expired
class UnauthorizedException extends AppException {
  const UnauthorizedException({
    super.message = 'Unauthorized. Please log in again.',
    super.statusCode = 401,
  });
}

/// 403 Forbidden
class ForbiddenException extends AppException {
  const ForbiddenException({
    super.message = 'You do not have permission to perform this action.',
    super.statusCode = 403,
  });
}

/// 404 Not Found
class NotFoundException extends AppException {
  const NotFoundException({
    super.message = 'The requested resource was not found.',
    super.statusCode = 404,
  });
}

/// 409 Conflict — e.g. email already registered
class ConflictException extends AppException {
  const ConflictException({
    super.message = 'A conflict occurred with the current state of the resource.',
    super.statusCode = 409,
  });
}

/// 422 Unprocessable Entity — validation errors from server
class UnprocessableEntityException extends AppException {
  const UnprocessableEntityException({
    super.message = 'The request data is invalid.',
    super.statusCode = 422,
  });
}

/// 500+ Internal Server Error
class InternalServerException extends AppException {
  const InternalServerException({
    super.message = 'An unexpected server error occurred.',
    super.statusCode = 500,
  });
}

/// Generic server error for uncategorised status codes
class ServerException extends AppException {
  const ServerException({
    super.message = 'Server error occurred.',
    super.statusCode,
  });
}

// ─── Auth Exceptions ──────────────────────────────────────────────────────────

/// Thrown when email/password combination is wrong.
class InvalidCredentialsException extends AppException {
  const InvalidCredentialsException({
    super.message = 'Invalid email or password.',
    super.statusCode = 401,
  });
}

/// Thrown when a user account does not exist.
class UserNotFoundException extends AppException {
  const UserNotFoundException({
    super.message = 'No account found with this email address.',
    super.statusCode = 404,
  });
}

/// Thrown when trying to register with an already-used email.
class EmailAlreadyExistsException extends AppException {
  const EmailAlreadyExistsException({
    super.message = 'An account with this email address already exists.',
    super.statusCode = 409,
  });
}

/// Thrown when the provided password does not meet requirements.
class WeakPasswordException extends AppException {
  const WeakPasswordException({
    super.message =
        'Password is too weak. Use at least 8 characters with letters and numbers.',
  });
}

/// Thrown when the password reset token is invalid or expired.
class InvalidResetTokenException extends AppException {
  const InvalidResetTokenException({
    super.message = 'Password reset link is invalid or has expired.',
  });
}

// ─── Cache / Storage Exceptions ───────────────────────────────────────────────

/// Thrown when reading from local storage fails.
class CacheReadException extends AppException {
  const CacheReadException({
    super.message = 'Failed to read data from local storage.',
  });
}

/// Thrown when writing to local storage fails.
class CacheWriteException extends AppException {
  const CacheWriteException({
    super.message = 'Failed to write data to local storage.',
  });
}

/// Thrown when stored JSON cannot be parsed into a model.
class JsonParseException extends AppException {
  const JsonParseException({
    super.message = 'Failed to parse stored data. It may be corrupted.',
  });
}

/// Generic cache exception kept for backward compatibility.
class CacheException extends AppException {
  const CacheException({super.message = 'Cache error occurred.'});
}
