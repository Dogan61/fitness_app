import 'package:fitness_app/core/constants/app_constants.dart';
import 'package:fitness_app/core/route/router_constants.dart';
import 'package:fitness_app/core/widgets/custom_outlined_button.dart';
import 'package:fitness_app/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:fitness_app/feature/auth/presentation/cubit/auth_state.dart';
import 'package:fitness_app/feature/auth/presentation/widgets/auth_app_bar.dart';
import 'package:fitness_app/feature/auth/presentation/widgets/auth_label.dart';
import 'package:fitness_app/feature/auth/presentation/widgets/auth_text_field.dart';
import 'package:fitness_app/feature/auth/presentation/widgets/social_icon_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthAuthenticated) {
          GoRouter.of(context).go(RouterConstants.setupView);
        } else if (state is AuthFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: Scaffold(
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
              const _RegisterFormFields(),
              SizedBox(height: 20.h),
              const _PrivacyFields(),
              SizedBox(height: 25.h),
              BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  return CustomOutlinedButton(
                    text: AppConstants.registerButton,
                    onTap: state is AuthLoading ? null : () {},
                  );
                },
              ),
              SizedBox(height: 20.h),
              const Text(
                AppConstants.registerOrSignUpWith,
                style: TextStyle(color: Colors.white60),
              ),
              SizedBox(height: 15.h),
              const SocialIconSection(),
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
      ),
    );
  }
}

class _PrivacyFields extends StatelessWidget {
  const _PrivacyFields();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Text.rich(
        TextSpan(
          text: AppConstants.registerTermsPrefix,
          children: [
            TextSpan(
              text: AppConstants.registerTermsOfUse,
              style: TextStyle(
                color: AppConstants.authAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
            const TextSpan(text: ' and '),
            TextSpan(
              text: AppConstants.registerPrivacyPolicy,
              style: TextStyle(
                color: AppConstants.authAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white70, fontSize: 12),
      ),
    );
  }
}

class _RegisterFormFields extends StatelessWidget {
  const _RegisterFormFields();

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
