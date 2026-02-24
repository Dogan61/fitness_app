import 'package:equatable/equatable.dart';
import 'package:fitness_app/core/enums/activity_level.dart';
import 'package:fitness_app/core/enums/fitness_goal.dart';
import 'package:fitness_app/core/enums/gender.dart';

enum SetupStatus { initial, loading, success, failure }

class SetupState extends Equatable {
  const SetupState({
    this.gender,
    this.age,
    this.weight,
    this.height,
    this.activityLevel,
    this.goal,
    this.fullName,
    this.status = SetupStatus.initial,
    this.errorMessage,
  });

  final Gender? gender;
  final int? age;
  final double? weight;
  final double? height;
  final ActivityLevel? activityLevel;
  final FitnessGoal? goal;
  final String? fullName;
  final SetupStatus status;
  final String? errorMessage;

  SetupState copyWith({
    Gender? gender,
    int? age,
    double? weight,
    double? height,
    ActivityLevel? activityLevel,
    FitnessGoal? goal,
    String? fullName,
    SetupStatus? status,
    String? errorMessage,
  }) {
    return SetupState(
      gender: gender ?? this.gender,
      age: age ?? this.age,
      weight: weight ?? this.weight,
      height: height ?? this.height,
      activityLevel: activityLevel ?? this.activityLevel,
      goal: goal ?? this.goal,
      fullName: fullName ?? this.fullName,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  bool get isComplete =>
      gender != null &&
      age != null &&
      weight != null &&
      height != null &&
      activityLevel != null &&
      goal != null;

  @override
  List<Object?> get props => [
        gender,
        age,
        weight,
        height,
        activityLevel,
        goal,
        fullName,
        status,
        errorMessage,
      ];
}
