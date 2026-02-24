import 'package:equatable/equatable.dart';
import 'package:fitness_app/core/enums/activity_level.dart';
import 'package:fitness_app/core/enums/fitness_goal.dart';
import 'package:fitness_app/core/enums/gender.dart';

class UserProfile extends Equatable {
  const UserProfile({
    required this.gender,
    required this.age,
    required this.weight,
    required this.height,
    required this.activityLevel,
    required this.goal,
    this.fullName,
    this.photoUrl,
  });

  final Gender gender;
  final int age;
  final double weight;
  final double height;
  final ActivityLevel activityLevel;
  final FitnessGoal goal;
  final String? fullName;
  final String? photoUrl;

  UserProfile copyWith({
    Gender? gender,
    int? age,
    double? weight,
    double? height,
    ActivityLevel? activityLevel,
    FitnessGoal? goal,
    String? fullName,
    String? photoUrl,
  }) {
    return UserProfile(
      gender: gender ?? this.gender,
      age: age ?? this.age,
      weight: weight ?? this.weight,
      height: height ?? this.height,
      activityLevel: activityLevel ?? this.activityLevel,
      goal: goal ?? this.goal,
      fullName: fullName ?? this.fullName,
      photoUrl: photoUrl ?? this.photoUrl,
    );
  }

  @override
  List<Object?> get props => [
        gender,
        age,
        weight,
        height,
        activityLevel,
        goal,
        fullName,
        photoUrl,
      ];
}
