import 'package:dartz/dartz.dart';
import 'package:fitness_app/core/error/failures.dart';
import 'package:fitness_app/feature/setup/domain/entities/user_profile.dart';

abstract interface class SetupRepository {
  Future<Either<Failure, void>> saveUserProfile(UserProfile profile);
  Future<Either<Failure, UserProfile?>> getUserProfile();
}
