import 'package:equatable/equatable.dart';
import 'package:fitness_app/feature/profile/domain/entities/profile.dart';

enum ProfileStatus { initial, loading, success, failure, editing }

class ProfileState extends Equatable {
  const ProfileState({
    this.profile,
    this.status = ProfileStatus.initial,
    this.errorMessage,
    this.isEditMode = false,
  });

  final Profile? profile;
  final ProfileStatus status;
  final String? errorMessage;
  final bool isEditMode;

  ProfileState copyWith({
    Profile? profile,
    ProfileStatus? status,
    String? errorMessage,
    bool? isEditMode,
  }) {
    return ProfileState(
      profile: profile ?? this.profile,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      isEditMode: isEditMode ?? this.isEditMode,
    );
  }

  @override
  List<Object?> get props => [profile, status, errorMessage, isEditMode];
}
