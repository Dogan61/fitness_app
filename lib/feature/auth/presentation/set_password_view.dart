import 'package:fitness_app/core/constants/app_constants.dart';
import 'package:fitness_app/core/route/router_constants.dart';
import 'package:fitness_app/core/widgets/custom_outlined_button.dart';
import 'package:fitness_app/feature/auth/presentation/widgets/auth_app_bar.dart';
import 'package:fitness_app/feature/auth/presentation/widgets/auth_label.dart';
import 'package:fitness_app/feature/auth/presentation/widgets/auth_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SetPasswordView extends StatelessWidget {
  const SetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.authBackground,
      appBar: const AuthAppBar(title: AppConstants.setPasswordTitle),
      body: Column(
        children: [
          const SizedBox(height: 50),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              AppConstants.setPasswordDescription,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
                height: 1.4,
              ),
            ),
          ),
          const SizedBox(height: 40),

          // Mor Form Alanı
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 24),
            decoration: const BoxDecoration(
              color: AppConstants.authPurple,
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AuthLabel(text: AppConstants.setPasswordPassword),
                AuthTextField(
                  hintText: "**************",
                  isPassword: true,
                ),
                SizedBox(height: 20),
                AuthLabel(text: AppConstants.setPasswordConfirmPassword),
                AuthTextField(
                  hintText: "**************",
                  isPassword: true,
                ),
              ],
            ),
          ),
          const SizedBox(height: 60),
          CustomOutlinedButton(
            text: "Reset Password",
            onTap: () => {
              GoRouter.of(context).push(RouterConstants.setupView),
            },
          ),
        ],
      ),
    );
  }
}
