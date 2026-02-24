import 'package:fitness_app/core/enums/activity_level.dart';
import 'package:fitness_app/core/enums/fitness_goal.dart';
import 'package:fitness_app/core/enums/gender.dart';
import 'package:fitness_app/feature/setup/domain/entities/user_profile.dart';
import 'package:fitness_app/feature/setup/domain/usecases/save_user_profile_usecase.dart';
import 'package:fitness_app/feature/setup/presentation/cubit/setup_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SetupCubit extends Cubit<SetupState> {
  SetupCubit({required SaveUserProfileUseCase saveUserProfileUseCase})
      : _saveUserProfileUseCase = saveUserProfileUseCase,
        super(const SetupState());

  final SaveUserProfileUseCase _saveUserProfileUseCase;

  void selectGender(Gender gender) {
    emit(state.copyWith(gender: gender));
  }

  void selectAge(int age) {
    emit(state.copyWith(age: age));
  }

  void selectWeight(double weight) {
    emit(state.copyWith(weight: weight));
  }

  void selectHeight(double height) {
    emit(state.copyWith(height: height));
  }

  void selectActivityLevel(ActivityLevel level) {
    emit(state.copyWith(activityLevel: level));
  }

  void selectGoal(FitnessGoal goal) {
    emit(state.copyWith(goal: goal));
  }

  void setFullName(String name) {
    emit(state.copyWith(fullName: name));
  }

  Future<void> saveProfile() async {
    if (!state.isComplete) return;

    emit(state.copyWith(status: SetupStatus.loading));

    final profile = UserProfile(
      gender: state.gender!,
      age: state.age!,
      weight: state.weight!,
      height: state.height!,
      activityLevel: state.activityLevel!,
      goal: state.goal!,
      fullName: state.fullName,
    );

    final result = await _saveUserProfileUseCase(profile);
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: SetupStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (_) => emit(state.copyWith(status: SetupStatus.success)),
    );
  }
}
