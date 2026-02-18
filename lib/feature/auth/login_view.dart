import 'package:fitness_app/core/constants/app_constants.dart';
import 'package:fitness_app/core/route/router_constants.dart';
import 'package:fitness_app/core/widgets/auth_app_bar.dart';
import 'package:fitness_app/core/widgets/auth_social_icon.dart';
import 'package:fitness_app/core/widgets/auth_text_field.dart';
import 'package:fitness_app/core/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.authBackground,
      appBar: const AuthAppBar(title: AppConstants.loginTitle),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 32.h),
            const Text(
              AppConstants.loginWelcome,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                AppConstants.loginDescription,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
            SizedBox(height: 24.h),

            // Mor Giriş Alanı
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 24),
              decoration: const BoxDecoration(
                color: AppConstants.authPurple, // Görseldeki mor tonu
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    AppConstants.loginUsernameLabel,
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const AuthTextField(
                    hintText: AppConstants.loginEmailHint,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    AppConstants.loginPasswordLabel,
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  const AuthTextField(
                    hintText: AppConstants.loginPasswordHint,
                    isPassword: true,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () async {
                        await GoRouter.of(
                          context,
                        ).push(RouterConstants.forgotPasswordView);
                      },
                      child: const Text(
                        AppConstants.loginForgotPassword,
                        style: TextStyle(color: Colors.black87),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 24.h),

            const CustomOutlinedButton(
              text: AppConstants.loginButton,
              //Todo    onTap: () => GoRouter.of(context).push(RouterConstants.homeView),
            ),
            SizedBox(height: 16.h),
            const Text(
              AppConstants.loginOrSignUpWith,
              style: TextStyle(color: Colors.white60),
            ),
            SizedBox(height: 20.h),

            // Sosyal İkonlar
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

            SizedBox(height: 32.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  AppConstants.loginDontHaveAccount,
                  style: TextStyle(color: Colors.white60),
                ),
                TextButton(
                  onPressed: () async {
                    await GoRouter.of(context).push(RouterConstants.registerView);
                  },
                  child: const Text(
                    AppConstants.loginSignUp,
                    style: TextStyle(color: AppConstants.authAccent),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
