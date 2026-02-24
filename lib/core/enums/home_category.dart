import 'package:flutter/material.dart';

enum HomeCategory {
  workout,
  progressTracking,
  nutrition,
  community;

  String get displayName => switch (this) {
        HomeCategory.workout => 'Workout',
        HomeCategory.progressTracking => 'Progress\nTracking',
        HomeCategory.nutrition => 'Nutrition',
        HomeCategory.community => 'Community',
      };

  IconData get icon => switch (this) {
        HomeCategory.workout => Icons.fitness_center,
        HomeCategory.progressTracking => Icons.track_changes,
        HomeCategory.nutrition => Icons.apple,
        HomeCategory.community => Icons.group,
      };
}
