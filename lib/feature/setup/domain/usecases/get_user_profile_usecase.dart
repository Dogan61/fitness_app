import 'package:dartz/dartz.dart';
import 'package:fitness_app/core/error/failures.dart';
import 'package:fitness_app/core/usecases/usecase.dart';
import 'package:fitness_app/feature/setup/domain/entities/user_profile.dart';
import 'package:fitness_app/feature/setup/domain/repositories/setup_repository.dart';

class GetUserProfileUseCase implements UseCase<UserProfile?, NoParams> {
  const GetUserProfileUseCase(this._repository);
  final SetupRepository _repository;

  @override
  Future<Either<Failure, UserProfile?>> call(NoParams params) {
    return _repository.getUserProfile();
  }
}
