import 'package:fitness_app/core/enums/activity_level.dart';
import 'package:fitness_app/core/enums/fitness_goal.dart';
import 'package:fitness_app/core/enums/gender.dart';
import 'package:fitness_app/feature/setup/domain/entities/user_profile.dart';

class UserProfileModel extends UserProfile {
  const UserProfileModel({
    required super.gender,
    required super.age,
    required super.weight,
    required super.height,
    required super.activityLevel,
    required super.goal,
    super.fullName,
    super.photoUrl,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      gender: Gender.values.firstWhere(
        (g) => g.name == json['gender'] as String,
        orElse: () => Gender.male,
      ),
      age: json['age'] as int,
      weight: (json['weight'] as num).toDouble(),
      height: (json['height'] as num).toDouble(),
      activityLevel: ActivityLevel.values.firstWhere(
        (a) => a.name == json['activity_level'] as String,
        orElse: () => ActivityLevel.beginner,
      ),
      goal: FitnessGoal.values.firstWhere(
        (g) => g.name == json['goal'] as String,
        orElse: () => FitnessGoal.loseWeight,
      ),
      fullName: json['full_name'] as String?,
      photoUrl: json['photo_url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'gender': gender.name,
      'age': age,
      'weight': weight,
      'height': height,
      'activity_level': activityLevel.name,
      'goal': goal.name,
      'full_name': fullName,
      'photo_url': photoUrl,
    };
  }

  factory UserProfileModel.fromEntity(UserProfile profile) {
    return UserProfileModel(
      gender: profile.gender,
      age: profile.age,
      weight: profile.weight,
      height: profile.height,
      activityLevel: profile.activityLevel,
      goal: profile.goal,
      fullName: profile.fullName,
      photoUrl: profile.photoUrl,
    );
  }
}
