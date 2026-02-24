import 'package:fitness_app/core/constants/app_constants.dart';
import 'package:fitness_app/core/route/router_constants.dart';
import 'package:fitness_app/core/widgets/custom_outlined_button.dart';
import 'package:fitness_app/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:fitness_app/feature/auth/presentation/cubit/auth_state.dart';
import 'package:fitness_app/feature/auth/presentation/widgets/auth_app_bar.dart';
import 'package:fitness_app/feature/auth/presentation/widgets/auth_text_field.dart';
import 'package:fitness_app/feature/auth/presentation/widgets/social_icon_section.dart';
import 'package:fitness_app/feature/setup/presentation/widgets/header_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthAuthenticated) {
          GoRouter.of(context).go(RouterConstants.homeView);
        } else if (state is AuthFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppConstants.authBackground,
        appBar: const AuthAppBar(title: AppConstants.loginTitle),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(16),
                child: HeaderSection(
                  title: AppConstants.loginWelcome,
                  description: AppConstants.loginDescription,
                ),
              ),
              const LoginTextFieldArea(),
              SizedBox(height: 24.h),
              BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  return CustomOutlinedButton(
                    text: AppConstants.loginButton,
                    onTap: state is AuthLoading ? null : () {},
                  );
                },
              ),
              SizedBox(height: 16.h),
              const Text(
                AppConstants.loginOrSignUpWith,
                style: TextStyle(color: Colors.white60),
              ),
              SizedBox(height: 20.h),
              const SocialIconSection(),
              SizedBox(height: 32.h),
              const _DontHaveSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class _DontHaveSection extends StatelessWidget {
  const _DontHaveSection();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          AppConstants.loginDontHaveAccount,
          style: TextStyle(color: Colors.white60),
        ),
        TextButton(
          onPressed: () async {
            await GoRouter.of(
              context,
            ).push(RouterConstants.registerView);
          },
          child: const Text(
            AppConstants.loginSignUp,
            style: TextStyle(color: AppConstants.authAccent),
          ),
        ),
      ],
    );
  }
}

class LoginTextFieldArea extends StatelessWidget {
  const LoginTextFieldArea({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
