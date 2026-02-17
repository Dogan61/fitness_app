import 'package:fitness_app/core/theme/app_typografy.dart';
import 'package:flutter/material.dart';

extension ThemeExtension on ThemeData {
  ThemeData get lightTheme =>
      ThemeData(useMaterial3: true, textTheme: AppTypography.textTheme);
}
extension ContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
}
