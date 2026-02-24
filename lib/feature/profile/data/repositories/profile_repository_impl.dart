import 'package:dartz/dartz.dart';
import 'package:fitness_app/core/error/exceptions.dart';
import 'package:fitness_app/core/error/failures.dart';
import 'package:fitness_app/feature/profile/data/datasources/profile_local_data_source.dart';
import 'package:fitness_app/feature/profile/data/models/profile_model.dart';
import 'package:fitness_app/feature/profile/domain/entities/profile.dart';
import 'package:fitness_app/feature/profile/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  const ProfileRepositoryImpl(this._localDataSource);
  final ProfileLocalDataSource _localDataSource;

  @override
  Future<Either<Failure, Profile>> getProfile() async {
    try {
      final profile = await _localDataSource.getProfile();
      return Right(profile ?? ProfileModel.mock);
    } on JsonParseException catch (e) {
      return Left(JsonParseFailure(message: e.message));
    } on CacheReadException catch (e) {
      return Left(CacheReadFailure(message: e.message));
    } on AppException catch (e) {
      return Left(CacheFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, Profile>> updateProfile(Profile profile) async {
    try {
      final model = ProfileModel.fromEntity(profile);
      await _localDataSource.saveProfile(model);
      return Right(profile);
    } on CacheWriteException catch (e) {
      return Left(CacheWriteFailure(message: e.message));
    } on AppException catch (e) {
      return Left(CacheFailure(message: e.message));
    }
  }
}
