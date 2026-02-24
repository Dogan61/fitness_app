import 'package:dartz/dartz.dart';
import 'package:fitness_app/core/error/exceptions.dart';
import 'package:fitness_app/core/error/failures.dart';
import 'package:fitness_app/feature/auth/data/datasources/auth_remote_data_source.dart';
import 'package:fitness_app/feature/auth/domain/entities/user.dart';
import 'package:fitness_app/feature/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl(this._remoteDataSource);
  final AuthRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, User>> login({
    required String email,
    required String password,
  }) async {
    try {
      final user =
          await _remoteDataSource.login(email: email, password: password);
      return Right(user);
    } on InvalidCredentialsException catch (e) {
      return Left(InvalidCredentialsFailure(message: e.message));
    } on UserNotFoundException catch (e) {
      return Left(UserNotFoundFailure(message: e.message));
    } on NoInternetException catch (e) {
      return Left(NoInternetFailure(message: e.message));
    } on ConnectionTimeoutException catch (e) {
      return Left(ConnectionTimeoutFailure(message: e.message));
    } on ReceiveTimeoutException catch (e) {
      return Left(ReceiveTimeoutFailure(message: e.message));
    } on UnauthorizedException catch (e) {
      return Left(UnauthorizedFailure(message: e.message));
    } on AppException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  Future<Either<Failure, User>> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final user = await _remoteDataSource.register(
        name: name,
        email: email,
        password: password,
      );
      return Right(user);
    } on EmailAlreadyExistsException catch (e) {
      return Left(EmailAlreadyExistsFailure(message: e.message));
    } on WeakPasswordException catch (e) {
      return Left(WeakPasswordFailure(message: e.message));
    } on NoInternetException catch (e) {
      return Left(NoInternetFailure(message: e.message));
    } on ConnectionTimeoutException catch (e) {
      return Left(ConnectionTimeoutFailure(message: e.message));
    } on ReceiveTimeoutException catch (e) {
      return Left(ReceiveTimeoutFailure(message: e.message));
    } on AppException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  Future<Either<Failure, void>> forgotPassword({required String email}) async {
    try {
      await _remoteDataSource.forgotPassword(email: email);
      return const Right(null);
    } on UserNotFoundException catch (e) {
      return Left(UserNotFoundFailure(message: e.message));
    } on NoInternetException catch (e) {
      return Left(NoInternetFailure(message: e.message));
    } on ConnectionTimeoutException catch (e) {
      return Left(ConnectionTimeoutFailure(message: e.message));
    } on AppException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  Future<Either<Failure, void>> resetPassword({
    required String token,
    required String newPassword,
  }) async {
    try {
      await _remoteDataSource.resetPassword(
        token: token,
        newPassword: newPassword,
      );
      return const Right(null);
    } on InvalidResetTokenException catch (e) {
      return Left(InvalidResetTokenFailure(message: e.message));
    } on NoInternetException catch (e) {
      return Left(NoInternetFailure(message: e.message));
    } on ConnectionTimeoutException catch (e) {
      return Left(ConnectionTimeoutFailure(message: e.message));
    } on AppException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    return const Right(null);
  }
}
