import 'dart:convert';

import 'package:fitness_app/core/error/exceptions.dart';
import 'package:fitness_app/feature/setup/data/models/user_profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class SetupLocalDataSource {
  Future<void> saveUserProfile(UserProfileModel profile);
  Future<UserProfileModel?> getUserProfile();
}

class SetupLocalDataSourceImpl implements SetupLocalDataSource {
  SetupLocalDataSourceImpl(this._prefs);
  final SharedPreferences _prefs;

  static const String _userProfileKey = 'user_profile';

  @override
  Future<void> saveUserProfile(UserProfileModel profile) async {
    try {
      final json = jsonEncode(profile.toJson());
      await _prefs.setString(_userProfileKey, json);
    } on Exception catch (e) {
      throw CacheWriteException(
        message: 'Failed to save user profile: $e',
      );
    }
  }

  @override
  Future<UserProfileModel?> getUserProfile() async {
    try {
      final json = _prefs.getString(_userProfileKey);
      if (json == null) return null;
      final map = jsonDecode(json) as Map<String, dynamic>;
      return UserProfileModel.fromJson(map);
    } on FormatException catch (e) {
      throw JsonParseException(
        message: 'User profile data is corrupted: ${e.message}',
      );
    } on Exception catch (e) {
      throw CacheReadException(
        message: 'Failed to load user profile: $e',
      );
    }
  }
}
