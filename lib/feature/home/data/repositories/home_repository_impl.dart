import 'package:dartz/dartz.dart';
import 'package:fitness_app/core/error/exceptions.dart';
import 'package:fitness_app/core/error/failures.dart';
import 'package:fitness_app/feature/home/data/datasources/home_remote_data_source.dart';
import 'package:fitness_app/feature/home/domain/entities/article.dart';
import 'package:fitness_app/feature/home/domain/entities/exercise.dart';
import 'package:fitness_app/feature/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  const HomeRepositoryImpl(this._remoteDataSource);
  final HomeRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, List<Exercise>>> getExercises() async {
    try {
      final exercises = await _remoteDataSource.getExercises();
      return Right(exercises);
    } on NoInternetException catch (e) {
      return Left(NoInternetFailure(message: e.message));
    } on ConnectionTimeoutException catch (e) {
      return Left(ConnectionTimeoutFailure(message: e.message));
    } on ReceiveTimeoutException catch (e) {
      return Left(ReceiveTimeoutFailure(message: e.message));
    } on UnauthorizedException catch (e) {
      return Left(UnauthorizedFailure(message: e.message));
    } on NotFoundException catch (e) {
      return Left(NotFoundFailure(message: e.message));
    } on AppException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  Future<Either<Failure, List<Article>>> getArticles() async {
    try {
      final articles = await _remoteDataSource.getArticles();
      return Right(articles);
    } on NoInternetException catch (e) {
      return Left(NoInternetFailure(message: e.message));
    } on ConnectionTimeoutException catch (e) {
      return Left(ConnectionTimeoutFailure(message: e.message));
    } on ReceiveTimeoutException catch (e) {
      return Left(ReceiveTimeoutFailure(message: e.message));
    } on UnauthorizedException catch (e) {
      return Left(UnauthorizedFailure(message: e.message));
    } on NotFoundException catch (e) {
      return Left(NotFoundFailure(message: e.message));
    } on AppException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  Future<Either<Failure, List<Exercise>>> getFavoriteExercises() async {
    try {
      final exercises = await _remoteDataSource.getExercises();
      return Right(exercises.where((e) => e.isFavorite).toList());
    } on NoInternetException catch (e) {
      return Left(NoInternetFailure(message: e.message));
    } on AppException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  Future<Either<Failure, void>> toggleFavoriteExercise(
    String exerciseId,
  ) async {
    return const Right(null);
  }

  @override
  Future<Either<Failure, void>> toggleFavoriteArticle(String articleId) async {
    return const Right(null);
  }
}
