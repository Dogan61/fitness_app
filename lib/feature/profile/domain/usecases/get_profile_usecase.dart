import 'package:dartz/dartz.dart';
import 'package:fitness_app/core/error/failures.dart';
import 'package:fitness_app/core/usecases/usecase.dart';
import 'package:fitness_app/feature/profile/domain/entities/profile.dart';
import 'package:fitness_app/feature/profile/domain/repositories/profile_repository.dart';

class GetProfileUseCase implements UseCase<Profile, NoParams> {
  const GetProfileUseCase(this._repository);
  final ProfileRepository _repository;

  @override
  Future<Either<Failure, Profile>> call(NoParams params) {
    return _repository.getProfile();
  }
}
