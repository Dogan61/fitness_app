import 'package:dartz/dartz.dart';
import 'package:fitness_app/core/error/failures.dart';
import 'package:fitness_app/core/usecases/usecase.dart';
import 'package:fitness_app/feature/home/domain/entities/article.dart';
import 'package:fitness_app/feature/home/domain/repositories/home_repository.dart';

class GetArticlesUseCase implements UseCase<List<Article>, NoParams> {
  const GetArticlesUseCase(this._repository);
  final HomeRepository _repository;

  @override
  Future<Either<Failure, List<Article>>> call(NoParams params) {
    return _repository.getArticles();
  }
}
