import 'package:dartz/dartz.dart';
import 'package:fitness_app/core/error/failures.dart';
import 'package:fitness_app/feature/profile/domain/entities/profile.dart';

abstract interface class ProfileRepository {
  Future<Either<Failure, Profile>> getProfile();
  Future<Either<Failure, Profile>> updateProfile(Profile profile);
}
