import 'package:fitness_app/core/constants/app_constants.dart';
import 'package:fitness_app/core/widgets/auth_app_bar.dart';
import 'package:fitness_app/core/widgets/auth_label.dart';
import 'package:fitness_app/core/widgets/auth_social_icon.dart';
import 'package:fitness_app/core/widgets/auth_text_field.dart';
import 'package:fitness_app/core/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.authBackground,
      appBar: const AuthAppBar(title: AppConstants.registerTitle),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 16.h),
            const Text(
              AppConstants.registerStart,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 24.h),

            // Mor Form Alanı
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 24),
              decoration: const BoxDecoration(color: AppConstants.authPurple),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AuthLabel(text: AppConstants.registerFullName),
                  const AuthTextField(
                    hintText: AppConstants.loginEmailHint,
                  ),
                  SizedBox(height: 15.h),
                  const AuthLabel(text: AppConstants.registerEmailOrPhone),
                  const AuthTextField(
                    hintText: '+123 567 89000',
                  ),
                  SizedBox(height: 15.h),
                  const AuthLabel(text: AppConstants.registerPassword),
                  const AuthTextField(
                    hintText: '**************',
                    isPassword: true,
                  ),
                  SizedBox(height: 15.h),
                  const AuthLabel(text: AppConstants.registerConfirmPassword),
                  const AuthTextField(
                    hintText: '**************',
                    isPassword: true,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text.rich(
                TextSpan(
                  text: AppConstants.registerTermsPrefix,
                  children: [
                    TextSpan(
                      text: AppConstants.registerTermsOfUse,
                      style: TextStyle(
                        color: Color(0xFFE5F876),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: ' and '),
                    TextSpan(
                      text: AppConstants.registerPrivacyPolicy,
                      style: TextStyle(
                        color: Color(0xFFE5F876),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70, fontSize: 12),
              ),
            ),

            SizedBox(height: 25.h),

            const CustomOutlinedButton(text: AppConstants.registerButton),

            SizedBox(height: 20.h),
            const Text(
              AppConstants.registerOrSignUpWith,
              style: TextStyle(color: Colors.white60),
            ),
            SizedBox(height: 15.h),

            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AuthSocialIcon(icon: Icons.g_mobiledata),
                SizedBox(width: 15),
                AuthSocialIcon(icon: Icons.facebook),
                SizedBox(width: 15),
                AuthSocialIcon(icon: Icons.fingerprint),
              ],
            ),

            SizedBox(height: 30.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  AppConstants.registerAlreadyHaveAccount,
                  style: TextStyle(color: Colors.white60),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    AppConstants.registerLogin,
                    style: TextStyle(color: AppConstants.authAccent),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
