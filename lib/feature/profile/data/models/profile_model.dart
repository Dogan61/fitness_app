import 'package:fitness_app/feature/profile/domain/entities/profile.dart';

class ProfileModel extends Profile {
  const ProfileModel({
    required super.id,
    required super.fullName,
    required super.email,
    super.nickname,
    super.dateOfBirth,
    super.phoneNumber,
    super.gender,
    super.photoUrl,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'] as String,
      fullName: json['full_name'] as String,
      email: json['email'] as String,
      nickname: json['nickname'] as String?,
      dateOfBirth: json['date_of_birth'] as String?,
      phoneNumber: json['phone_number'] as String?,
      gender: json['gender'] as String?,
      photoUrl: json['photo_url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'full_name': fullName,
      'email': email,
      'nickname': nickname,
      'date_of_birth': dateOfBirth,
      'phone_number': phoneNumber,
      'gender': gender,
      'photo_url': photoUrl,
    };
  }

  factory ProfileModel.fromEntity(Profile profile) {
    return ProfileModel(
      id: profile.id,
      fullName: profile.fullName,
      email: profile.email,
      nickname: profile.nickname,
      dateOfBirth: profile.dateOfBirth,
      phoneNumber: profile.phoneNumber,
      gender: profile.gender,
      photoUrl: profile.photoUrl,
    );
  }

  static ProfileModel get mock => const ProfileModel(
        id: '1',
        fullName: 'Madison Smith',
        email: 'madison@example.com',
        nickname: 'Madison',
        dateOfBirth: '14/04/1990',
        phoneNumber: '+62 1122 3344 55',
        gender: 'Female',
      );
}
