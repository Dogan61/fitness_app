import 'package:fitness_app/core/constants/app_constants.dart';
import 'package:fitness_app/core/route/router_constants.dart';
import 'package:fitness_app/core/widgets/custom_outlined_button.dart';
import 'package:fitness_app/feature/auth/presentation/widgets/auth_app_bar.dart';
import 'package:fitness_app/feature/auth/presentation/widgets/auth_text_field.dart';
import 'package:fitness_app/feature/setup/presentation/widgets/header_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.authBackground,
      appBar: const AuthAppBar(title: AppConstants.forgotPasswordTitle),
      body: Column(
        children: [
          const SizedBox(height: 80),
          const HeaderSection(
            title: AppConstants.forgotPasswordTitle,
            description: AppConstants.forgotPasswordDescription,
          ),
          SizedBox(height: 20.h),

          const _PasswordFields(),
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: CustomOutlinedButton(
              text: "Continue",
              onTap: () async {
                await GoRouter.of(
                  context,
                ).push(RouterConstants.setPasswordView);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _PasswordFields extends StatelessWidget {
  const _PasswordFields();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
      decoration: const BoxDecoration(
        color: AppConstants.authPurple, // Tasarımdaki mor renk
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            AppConstants.forgotPasswordEnterEmail,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 12.h),
          const AuthTextField(
            hintText: AppConstants.forgotPasswordEmailHint,
          ),
        ],
      ),
    );
  }
}
