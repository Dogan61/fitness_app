import 'package:fitness_app/core/constants/app_constants.dart';
import 'package:fitness_app/core/widgets/custom_outlined_button.dart';
import 'package:fitness_app/feature/setup/presentation/widgets/setup_app_bar.dart';
import 'package:flutter/material.dart';

mixin SetupPageMixin<T extends StatefulWidget> on State<T> {
  Widget buildPageContent();
  VoidCallback? get onContinue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.authBackground,
      appBar: const SetupAppBar(),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: buildPageContent(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: CustomOutlinedButton(
              text: AppConstants.continueTex,
              onTap: onContinue,
            ),
          ),
        ],
      ),
    );
  }
}
