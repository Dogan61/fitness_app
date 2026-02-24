import 'package:fitness_app/core/enums/home_category.dart';
import 'package:fitness_app/core/usecases/usecase.dart';
import 'package:fitness_app/feature/home/domain/usecases/get_articles_usecase.dart';
import 'package:fitness_app/feature/home/domain/usecases/get_exercises_usecase.dart';
import 'package:fitness_app/feature/home/presentation/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required GetExercisesUseCase getExercisesUseCase,
    required GetArticlesUseCase getArticlesUseCase,
  })  : _getExercisesUseCase = getExercisesUseCase,
        _getArticlesUseCase = getArticlesUseCase,
        super(const HomeState());

  final GetExercisesUseCase _getExercisesUseCase;
  final GetArticlesUseCase _getArticlesUseCase;

  Future<void> loadHomeData() async {
    emit(state.copyWith(status: HomeStatus.loading));

    final exercisesResult = await _getExercisesUseCase(const NoParams());
    final articlesResult = await _getArticlesUseCase(const NoParams());

    exercisesResult.fold(
      (failure) => emit(
        state.copyWith(
          status: HomeStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (exercises) {
        articlesResult.fold(
          (failure) => emit(
            state.copyWith(
              status: HomeStatus.failure,
              errorMessage: failure.message,
            ),
          ),
          (articles) => emit(
            state.copyWith(
              status: HomeStatus.success,
              exercises: exercises,
              articles: articles,
            ),
          ),
        );
      },
    );
  }

  void selectCategory(HomeCategory category) {
    emit(state.copyWith(selectedCategory: category));
  }
}
