import 'package:dartz/dartz.dart';
import 'package:fitness_app/core/error/failures.dart';
import 'package:fitness_app/core/usecases/usecase.dart';
import 'package:fitness_app/feature/home/domain/entities/exercise.dart';
import 'package:fitness_app/feature/home/domain/repositories/home_repository.dart';

class GetExercisesUseCase implements UseCase<List<Exercise>, NoParams> {
  const GetExercisesUseCase(this._repository);
  final HomeRepository _repository;

  @override
  Future<Either<Failure, List<Exercise>>> call(NoParams params) {
    return _repository.getExercises();
  }
}
