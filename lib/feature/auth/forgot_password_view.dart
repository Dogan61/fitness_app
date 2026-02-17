import 'package:fitness_app/core/constants/app_constants.dart';
import 'package:fitness_app/core/route/router_constants.dart';
import 'package:fitness_app/widgets/auth_app_bar.dart';
import 'package:fitness_app/widgets/auth_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.authBackground, // Ana koyu arka plan
      appBar: const AuthAppBar(title: AppConstants.forgotPasswordTitle),
      body: Column(
        children: [
          const SizedBox(height: 80),
          const Text(
            AppConstants.forgotPasswordHeader,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: Text(
              AppConstants.forgotPasswordDescription,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
                height: 1.5,
              ),
            ),
          ),
          SizedBox(height: 20.h),

          // Mor Giriş Alanı
          Container(
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
          ),

          const SizedBox(height: 50),

          // Continue Butonu
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: OutlinedButton(
              onPressed: () {
                GoRouter .of(context).push(RouterConstants.setPasswordView);

              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.white60, width: 1.5),
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 60,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                backgroundColor: Colors.transparent,
              ),
              child: const Text(
                AppConstants.forgotPasswordContinue,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
