import 'package:equatable/equatable.dart';
import 'package:fitness_app/core/enums/home_category.dart';
import 'package:fitness_app/feature/home/domain/entities/article.dart';
import 'package:fitness_app/feature/home/domain/entities/exercise.dart';

enum HomeStatus { initial, loading, success, failure }

class HomeState extends Equatable {
  const HomeState({
    this.selectedCategory = HomeCategory.workout,
    this.exercises = const [],
    this.articles = const [],
    this.status = HomeStatus.initial,
    this.errorMessage,
  });

  final HomeCategory selectedCategory;
  final List<Exercise> exercises;
  final List<Article> articles;
  final HomeStatus status;
  final String? errorMessage;

  HomeState copyWith({
    HomeCategory? selectedCategory,
    List<Exercise>? exercises,
    List<Article>? articles,
    HomeStatus? status,
    String? errorMessage,
  }) {
    return HomeState(
      selectedCategory: selectedCategory ?? this.selectedCategory,
      exercises: exercises ?? this.exercises,
      articles: articles ?? this.articles,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props =>
      [selectedCategory, exercises, articles, status, errorMessage];
}
