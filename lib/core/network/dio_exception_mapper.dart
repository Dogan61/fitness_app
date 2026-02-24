import 'package:dio/dio.dart';
import 'package:fitness_app/core/error/exceptions.dart';

/// Maps a [DioException] to a typed [AppException].
///
/// Usage in a data source:
/// ```dart
/// } on DioException catch (e) {
///   throw DioExceptionMapper.map(e);
/// }
/// ```
final class DioExceptionMapper {
  DioExceptionMapper._();

  static AppException map(DioException e) {
    return switch (e.type) {
      DioExceptionType.connectionTimeout => const ConnectionTimeoutException(),
      DioExceptionType.sendTimeout => const ConnectionTimeoutException(
          message: 'Request send timed out.',
        ),
      DioExceptionType.receiveTimeout => const ReceiveTimeoutException(),
      DioExceptionType.badCertificate => const BadCertificateException(),
      DioExceptionType.connectionError => const NoInternetException(),
      DioExceptionType.cancel =>
        const ServerException(message: 'Request was cancelled.'),
      DioExceptionType.badResponse => _mapStatusCode(e),
      DioExceptionType.unknown => _mapUnknown(e),
    };
  }

  static AppException _mapStatusCode(DioException e) {
    final statusCode = e.response?.statusCode;
    final serverMessage = _extractServerMessage(e);

    return switch (statusCode) {
      400 => BadRequestException(message: serverMessage),
      401 => UnauthorizedException(message: serverMessage),
      403 => ForbiddenException(message: serverMessage),
      404 => NotFoundException(message: serverMessage),
      409 => ConflictException(message: serverMessage),
      422 => UnprocessableEntityException(message: serverMessage),
      500 => InternalServerException(
          message: serverMessage,
          statusCode: statusCode,
        ),
      _ => ServerException(
          message: serverMessage,
          statusCode: statusCode,
        ),
    };
  }

  static AppException _mapUnknown(DioException e) {
    final inner = e.error;
    if (inner != null && inner.toString().contains('SocketException')) {
      return const NoInternetException();
    }
    return ServerException(message: e.message ?? 'An unknown error occurred.');
  }

  /// Tries to extract a human-readable message from the server response body.
  static String _extractServerMessage(DioException e) {
    try {
      final data = e.response?.data;
      if (data is Map<String, dynamic>) {
        return (data['message'] as String?) ??
            (data['error'] as String?) ??
            e.message ??
            'Server error occurred.';
      }
      if (data is String && data.isNotEmpty) return data;
    } on Exception {
      // fallthrough to default
    }
    return e.message ?? 'Server error occurred.';
  }
}
