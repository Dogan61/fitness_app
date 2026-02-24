import 'package:fitness_app/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:fitness_app/feature/auth/presentation/forgot_password_view.dart';
import 'package:fitness_app/feature/auth/presentation/login_view.dart';
import 'package:fitness_app/feature/auth/presentation/register_view.dart';
import 'package:fitness_app/feature/auth/presentation/set_fingerprint_view.dart';
import 'package:fitness_app/feature/auth/presentation/set_password_view.dart';
import 'package:fitness_app/feature/home/presentation/cubit/home_cubit.dart';
import 'package:fitness_app/feature/home/presentation/home_view.dart';
import 'package:fitness_app/feature/profile/presentation/cubit/profile_cubit.dart';
import 'package:fitness_app/feature/profile/presentation/favorites_view.dart';
import 'package:fitness_app/feature/profile/presentation/profile_view.dart';
import 'package:fitness_app/feature/setup/presentation/create_profile_view.dart';
import 'package:fitness_app/feature/setup/presentation/cubit/setup_cubit.dart';
import 'package:fitness_app/feature/setup/presentation/gender_choose_view.dart';
import 'package:fitness_app/feature/setup/presentation/goal_view.dart';
import 'package:fitness_app/feature/setup/presentation/height_select_view.dart';
import 'package:fitness_app/feature/setup/presentation/how_old_view.dart';
import 'package:fitness_app/feature/setup/presentation/physical_activity_view.dart';
import 'package:fitness_app/feature/setup/presentation/setup_view.dart';
import 'package:fitness_app/feature/setup/presentation/weight_select_view.dart';
import 'package:fitness_app/injection_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:fitness_app/core/route/router_constants.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: RouterConstants.loginView,
    routes: [
      // ─── Auth ───────────────────────────────────────────────────────────
      GoRoute(
        path: RouterConstants.loginView,
        builder: (context, state) => BlocProvider(
          create: (_) => sl<AuthCubit>(),
          child: const LoginView(),
        ),
      ),
      GoRoute(
        path: RouterConstants.registerView,
        builder: (context, state) => BlocProvider(
          create: (_) => sl<AuthCubit>(),
          child: const RegisterView(),
        ),
      ),
      GoRoute(
        path: RouterConstants.forgotPasswordView,
        builder: (context, state) => const ForgotPasswordView(),
      ),
      GoRoute(
        path: RouterConstants.setPasswordView,
        builder: (context, state) => const SetPasswordView(),
      ),
      GoRoute(
        path: RouterConstants.setFingerprintView,
        builder: (context, state) => const SetFingerprintScreen(),
      ),

      // ─── Setup ──────────────────────────────────────────────────────────
      GoRoute(
        path: RouterConstants.setupView,
        builder: (context, state) => BlocProvider(
          create: (_) => sl<SetupCubit>(),
          child: const SetupView(),
        ),
      ),
      GoRoute(
        path: RouterConstants.genderChooseView,
        builder: (context, state) => BlocProvider(
          create: (_) => sl<SetupCubit>(),
          child: const GenderChooseView(),
        ),
      ),
      GoRoute(
        path: RouterConstants.howOldView,
        builder: (context, state) => BlocProvider(
          create: (_) => sl<SetupCubit>(),
          child: const HowOldView(),
        ),
      ),
      GoRoute(
        path: RouterConstants.weightSelectView,
        builder: (context, state) => BlocProvider(
          create: (_) => sl<SetupCubit>(),
          child: const WeightSelectView(),
        ),
      ),
      GoRoute(
        path: RouterConstants.heightSelectView,
        builder: (context, state) => BlocProvider(
          create: (_) => sl<SetupCubit>(),
          child: const HeightSelectView(),
        ),
      ),
      GoRoute(
        path: RouterConstants.physicalActivityView,
        builder: (context, state) => BlocProvider(
          create: (_) => sl<SetupCubit>(),
          child: const PhysicalActivityView(),
        ),
      ),
      GoRoute(
        path: RouterConstants.goalView,
        builder: (context, state) => BlocProvider(
          create: (_) => sl<SetupCubit>(),
          child: const GoalView(),
        ),
      ),
      GoRoute(
        path: RouterConstants.createProfileView,
        builder: (context, state) => BlocProvider(
          create: (_) => sl<SetupCubit>(),
          child: const CreateProfileView(),
        ),
      ),

      // ─── Home ───────────────────────────────────────────────────────────
      GoRoute(
        path: RouterConstants.homeView,
        builder: (context, state) => BlocProvider(
          create: (_) => sl<HomeCubit>()..loadHomeData(),
          child: const HomeView(),
        ),
      ),

      // ─── Profile ────────────────────────────────────────────────────────
      GoRoute(
        path: RouterConstants.profileView,
        builder: (context, state) => BlocProvider(
          create: (_) => sl<ProfileCubit>()..loadProfile(),
          child: const ProfileView(),
        ),
      ),
      GoRoute(
        path: RouterConstants.favoritesView,
        builder: (context, state) => BlocProvider(
          create: (_) => sl<ProfileCubit>()..loadProfile(),
          child: const FavoritesView(),
        ),
      ),
    ],
  );
}
