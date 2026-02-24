import 'package:dio/dio.dart';
import 'package:fitness_app/core/error/exceptions.dart';
import 'package:fitness_app/core/network/dio_exception_mapper.dart';
import 'package:fitness_app/feature/home/data/models/article_model.dart';
import 'package:fitness_app/feature/home/data/models/exercise_model.dart';

abstract interface class HomeRemoteDataSource {
  Future<List<ExerciseModel>> getExercises();
  Future<List<ArticleModel>> getArticles();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  const HomeRemoteDataSourceImpl({Dio? dio}) : _dio = dio;
  final Dio? _dio;

  @override
  Future<List<ExerciseModel>> getExercises() async {
    if (_dio == null) return ExerciseModel.mockData;

    try {
      final response =
          await _dio.get<List<dynamic>>('/exercises');
      return (response.data ?? [])
          .cast<Map<String, dynamic>>()
          .map(ExerciseModel.fromJson)
          .toList();
    } on DioException catch (e) {
      throw DioExceptionMapper.map(e);
    } on AppException {
      rethrow;
    } on FormatException catch (e) {
      throw ServerException(
        message: 'Invalid exercise data format: ${e.message}',
      );
    }
  }

  @override
  Future<List<ArticleModel>> getArticles() async {
    if (_dio == null) return ArticleModel.mockData;

    try {
      final response =
          await _dio.get<List<dynamic>>('/articles');
      return (response.data ?? [])
          .cast<Map<String, dynamic>>()
          .map(ArticleModel.fromJson)
          .toList();
    } on DioException catch (e) {
      throw DioExceptionMapper.map(e);
    } on AppException {
      rethrow;
    } on FormatException catch (e) {
      throw ServerException(
        message: 'Invalid article data format: ${e.message}',
      );
    }
  }
}
