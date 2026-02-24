import 'package:fitness_app/feature/home/domain/entities/exercise.dart';

class ExerciseModel extends Exercise {
  const ExerciseModel({
    required super.id,
    required super.title,
    required super.assetPath,
    required super.durationMinutes,
    required super.calories,
    super.isFavorite,
  });

  factory ExerciseModel.fromJson(Map<String, dynamic> json) {
    return ExerciseModel(
      id: json['id'] as String,
      title: json['title'] as String,
      assetPath: json['asset_path'] as String,
      durationMinutes: json['duration_minutes'] as int,
      calories: json['calories'] as int,
      isFavorite: json['is_favorite'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'asset_path': assetPath,
      'duration_minutes': durationMinutes,
      'calories': calories,
      'is_favorite': isFavorite,
    };
  }

  static List<ExerciseModel> get mockData => [
        const ExerciseModel(
          id: '1',
          title: 'Full Body Workout',
          assetPath: 'assets/images/ic_training_1.png',
          durationMinutes: 12,
          calories: 120,
        ),
        const ExerciseModel(
          id: '2',
          title: 'Cardio Training',
          assetPath: 'assets/images/ic_training_2.png',
          durationMinutes: 15,
          calories: 150,
        ),
      ];
}
