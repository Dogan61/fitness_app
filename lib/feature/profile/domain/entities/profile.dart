import 'package:equatable/equatable.dart';

class Profile extends Equatable {
  const Profile({
    required this.id,
    required this.fullName,
    required this.email,
    this.nickname,
    this.dateOfBirth,
    this.phoneNumber,
    this.gender,
    this.photoUrl,
  });

  final String id;
  final String fullName;
  final String email;
  final String? nickname;
  final String? dateOfBirth;
  final String? phoneNumber;
  final String? gender;
  final String? photoUrl;

  Profile copyWith({
    String? id,
    String? fullName,
    String? email,
    String? nickname,
    String? dateOfBirth,
    String? phoneNumber,
    String? gender,
    String? photoUrl,
  }) {
    return Profile(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      nickname: nickname ?? this.nickname,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      gender: gender ?? this.gender,
      photoUrl: photoUrl ?? this.photoUrl,
    );
  }

  @override
  List<Object?> get props => [
        id,
        fullName,
        email,
        nickname,
        dateOfBirth,
        phoneNumber,
        gender,
        photoUrl,
      ];
}
