enum ActivityLevel {
  beginner,
  intermediate,
  advanced;

  String get displayName => switch (this) {
        ActivityLevel.beginner => 'Beginner',
        ActivityLevel.intermediate => 'Intermediate',
        ActivityLevel.advanced => 'Advanced',
      };
}
