enum FitnessGoal {
  loseWeight,
  gainMuscle,
  keepFit,
  muscleMassGain,
  others;

  String get displayName => switch (this) {
        FitnessGoal.loseWeight => 'Lose Weight',
        FitnessGoal.gainMuscle => 'Gain Muscle',
        FitnessGoal.keepFit => 'Keep Fit',
        FitnessGoal.muscleMassGain => 'Muscle Mass Gain',
        FitnessGoal.others => 'Others',
      };
}
