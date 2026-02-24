import 'package:dio/dio.dart';
import 'package:fitness_app/core/error/exceptions.dart';
import 'package:fitness_app/core/network/dio_exception_mapper.dart';
import 'package:fitness_app/feature/auth/data/models/user_model.dart';

abstract interface class AuthRemoteDataSource {
  Future<UserModel> login({required String email, required String password});

  Future<UserModel> register({
    required String name,
    required String email,
    required String password,
  });

  Future<void> forgotPassword({required String email});

  Future<void> resetPassword({
    required String token,
    required String newPassword,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  const AuthRemoteDataSourceImpl(this._dio);
  final Dio _dio;

  @override
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/auth/login',
        data: {'email': email, 'password': password},
      );
      return UserModel.fromJson(response.data!);
    } on DioException catch (e) {
      final mapped = DioExceptionMapper.map(e);
      // 401 on login always means wrong credentials, not an expired token
      if (mapped is UnauthorizedException) {
        throw const InvalidCredentialsException();
      }
      if (mapped is NotFoundException) {
        throw const UserNotFoundException();
      }
      throw mapped;
    } on AppException {
      rethrow;
    } on FormatException catch (e) {
      throw ServerException(message: 'Invalid response format: ${e.message}');
    }
  }

  @override
  Future<UserModel> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/auth/register',
        data: {'name': name, 'email': email, 'password': password},
      );
      return UserModel.fromJson(response.data!);
    } on DioException catch (e) {
      final mapped = DioExceptionMapper.map(e);
      if (mapped is ConflictException) {
        throw const EmailAlreadyExistsException();
      }
      if (mapped is UnprocessableEntityException) {
        throw const WeakPasswordException();
      }
      throw mapped;
    } on AppException {
      rethrow;
    } on FormatException catch (e) {
      throw ServerException(message: 'Invalid response format: ${e.message}');
    }
  }

  @override
  Future<void> forgotPassword({required String email}) async {
    try {
      await _dio.post<void>(
        '/auth/forgot-password',
        data: {'email': email},
      );
    } on DioException catch (e) {
      final mapped = DioExceptionMapper.map(e);
      if (mapped is NotFoundException) {
        throw const UserNotFoundException();
      }
      throw mapped;
    } on AppException {
      rethrow;
    }
  }

  @override
  Future<void> resetPassword({
    required String token,
    required String newPassword,
  }) async {
    try {
      await _dio.post<void>(
        '/auth/reset-password',
        data: {'token': token, 'new_password': newPassword},
      );
    } on DioException catch (e) {
      final mapped = DioExceptionMapper.map(e);
      if (mapped is BadRequestException || mapped is UnprocessableEntityException) {
        throw const InvalidResetTokenException();
      }
      throw mapped;
    } on AppException {
      rethrow;
    }
  }
}
