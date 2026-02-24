import 'package:dartz/dartz.dart';
import 'package:fitness_app/core/error/failures.dart';
import 'package:fitness_app/core/usecases/usecase.dart';
import 'package:fitness_app/feature/profile/domain/entities/profile.dart';
import 'package:fitness_app/feature/profile/domain/repositories/profile_repository.dart';

class UpdateProfileUseCase implements UseCase<Profile, Profile> {
  const UpdateProfileUseCase(this._repository);
  final ProfileRepository _repository;

  @override
  Future<Either<Failure, Profile>> call(Profile params) {
    return _repository.updateProfile(params);
  }
}
