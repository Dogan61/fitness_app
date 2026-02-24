import 'package:dartz/dartz.dart';
import 'package:fitness_app/core/error/failures.dart';
import 'package:fitness_app/feature/home/domain/entities/article.dart';
import 'package:fitness_app/feature/home/domain/entities/exercise.dart';

abstract interface class HomeRepository {
  Future<Either<Failure, List<Exercise>>> getExercises();
  Future<Either<Failure, List<Article>>> getArticles();
  Future<Either<Failure, List<Exercise>>> getFavoriteExercises();
  Future<Either<Failure, void>> toggleFavoriteExercise(String exerciseId);
  Future<Either<Failure, void>> toggleFavoriteArticle(String articleId);
}
