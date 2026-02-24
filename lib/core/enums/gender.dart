import 'package:fitness_app/core/constants/app_constants.dart';

enum Gender {
  male,
  female;

  String get displayName => switch (this) {
        Gender.male => AppConstants.male,
        Gender.female => AppConstants.female,
      };
}
