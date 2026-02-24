import 'package:fitness_app/core/usecases/usecase.dart';
import 'package:fitness_app/feature/profile/domain/entities/profile.dart';
import 'package:fitness_app/feature/profile/domain/usecases/get_profile_usecase.dart';
import 'package:fitness_app/feature/profile/domain/usecases/update_profile_usecase.dart';
import 'package:fitness_app/feature/profile/presentation/cubit/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({
    required GetProfileUseCase getProfileUseCase,
    required UpdateProfileUseCase updateProfileUseCase,
  })  : _getProfileUseCase = getProfileUseCase,
        _updateProfileUseCase = updateProfileUseCase,
        super(const ProfileState());

  final GetProfileUseCase _getProfileUseCase;
  final UpdateProfileUseCase _updateProfileUseCase;

  Future<void> loadProfile() async {
    emit(state.copyWith(status: ProfileStatus.loading));
    final result = await _getProfileUseCase(const NoParams());
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: ProfileStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (profile) => emit(
        state.copyWith(status: ProfileStatus.success, profile: profile),
      ),
    );
  }

  Future<void> updateProfile(Profile profile) async {
    emit(state.copyWith(status: ProfileStatus.loading));
    final result = await _updateProfileUseCase(profile);
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: ProfileStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (updated) => emit(
        state.copyWith(
          status: ProfileStatus.success,
          profile: updated,
          isEditMode: false,
        ),
      ),
    );
  }

  void toggleEditMode() {
    emit(state.copyWith(isEditMode: !state.isEditMode));
  }

  void enterEditMode() {
    emit(state.copyWith(isEditMode: true, status: ProfileStatus.editing));
  }

  void cancelEditMode() {
    emit(state.copyWith(isEditMode: false, status: ProfileStatus.success));
  }
}
