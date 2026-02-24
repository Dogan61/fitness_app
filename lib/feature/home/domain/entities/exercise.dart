import 'package:equatable/equatable.dart';

class Exercise extends Equatable {
  const Exercise({
    required this.id,
    required this.title,
    required this.assetPath,
    required this.durationMinutes,
    required this.calories,
    this.isFavorite = false,
  });

  final String id;
  final String title;
  final String assetPath;
  final int durationMinutes;
  final int calories;
  final bool isFavorite;

  Exercise copyWith({
    String? id,
    String? title,
    String? assetPath,
    int? durationMinutes,
    int? calories,
    bool? isFavorite,
  }) {
    return Exercise(
      id: id ?? this.id,
      title: title ?? this.title,
      assetPath: assetPath ?? this.assetPath,
      durationMinutes: durationMinutes ?? this.durationMinutes,
      calories: calories ?? this.calories,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  List<Object?> get props =>
      [id, title, assetPath, durationMinutes, calories, isFavorite];
}
