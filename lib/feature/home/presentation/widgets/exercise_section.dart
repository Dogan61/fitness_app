import 'package:fitness_app/feature/home/domain/entities/exercise.dart';
import 'package:fitness_app/feature/home/presentation/widgets/exercise_card.dart';
import 'package:flutter/material.dart';

class ExerciseSection extends StatelessWidget {
  const ExerciseSection({
    required this.exercises,
    super.key,
  });

  final List<Exercise> exercises;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: exercises
            .take(2)
            .map(
              (exercise) => ExerciseCard(
                assetPath: exercise.assetPath,
                onPlay: null,
                onStar: null,
                cardTitle: exercise.title,
                durationLabel: '${exercise.durationMinutes} Min',
                caloriesLabel: '${exercise.calories} Kcal',
              ),
            )
            .toList(),
      ),
    );
  }
}
