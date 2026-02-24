import 'package:dartz/dartz.dart';
import 'package:fitness_app/core/error/exceptions.dart';
import 'package:fitness_app/core/error/failures.dart';
import 'package:fitness_app/feature/setup/data/datasources/setup_local_data_source.dart';
import 'package:fitness_app/feature/setup/data/models/user_profile_model.dart';
import 'package:fitness_app/feature/setup/domain/entities/user_profile.dart';
import 'package:fitness_app/feature/setup/domain/repositories/setup_repository.dart';

class SetupRepositoryImpl implements SetupRepository {
  const SetupRepositoryImpl(this._localDataSource);
  final SetupLocalDataSource _localDataSource;

  @override
  Future<Either<Failure, void>> saveUserProfile(UserProfile profile) async {
    try {
      final model = UserProfileModel.fromEntity(profile);
      await _localDataSource.saveUserProfile(model);
      return const Right(null);
    } on CacheWriteException catch (e) {
      return Left(CacheWriteFailure(message: e.message));
    } on AppException catch (e) {
      return Left(CacheFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, UserProfile?>> getUserProfile() async {
    try {
      final profile = await _localDataSource.getUserProfile();
      return Right(profile);
    } on JsonParseException catch (e) {
      return Left(JsonParseFailure(message: e.message));
    } on CacheReadException catch (e) {
      return Left(CacheReadFailure(message: e.message));
    } on AppException catch (e) {
      return Left(CacheFailure(message: e.message));
    }
  }
}
