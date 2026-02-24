import 'dart:convert';

import 'package:fitness_app/core/error/exceptions.dart';
import 'package:fitness_app/feature/profile/data/models/profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class ProfileLocalDataSource {
  Future<ProfileModel?> getProfile();
  Future<void> saveProfile(ProfileModel profile);
}

class ProfileLocalDataSourceImpl implements ProfileLocalDataSource {
  ProfileLocalDataSourceImpl(this._prefs);
  final SharedPreferences _prefs;

  static const String _profileKey = 'profile';

  @override
  Future<ProfileModel?> getProfile() async {
    try {
      final json = _prefs.getString(_profileKey);
      if (json == null) return ProfileModel.mock;
      final map = jsonDecode(json) as Map<String, dynamic>;
      return ProfileModel.fromJson(map);
    } on FormatException catch (e) {
      throw JsonParseException(
        message: 'Profile data is corrupted: ${e.message}',
      );
    } on Exception catch (e) {
      throw CacheReadException(
        message: 'Failed to load profile: $e',
      );
    }
  }

  @override
  Future<void> saveProfile(ProfileModel profile) async {
    try {
      final json = jsonEncode(profile.toJson());
      await _prefs.setString(_profileKey, json);
    } on Exception catch (e) {
      throw CacheWriteException(
        message: 'Failed to save profile: $e',
      );
    }
  }
}
