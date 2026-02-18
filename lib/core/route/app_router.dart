import 'package:fitness_app/core/route/router_constants.dart';
import 'package:fitness_app/feature/auth/forgot_password_view.dart';
import 'package:fitness_app/feature/auth/login_view.dart';
import 'package:fitness_app/feature/auth/register_view.dart';
import 'package:fitness_app/feature/auth/set_fingerprint_view.dart';
import 'package:fitness_app/feature/auth/set_password_view.dart';
import 'package:fitness_app/feature/home/home_view.dart';
import 'package:fitness_app/feature/setup/create_profile_view.dart';
import 'package:fitness_app/feature/setup/gender_choose_view.dart';
import 'package:fitness_app/feature/setup/height_select_view.dart';
import 'package:fitness_app/feature/setup/how_old_view.dart';
import 'package:fitness_app/feature/setup/physical_activity_view.dart';
import 'package:fitness_app/feature/setup/setup_view.dart';
import 'package:fitness_app/feature/setup/weight_select_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter._();
  static final GoRouter router = GoRouter(
    initialLocation: RouterConstants.homeView,
    routes: [
      GoRoute(
        path: RouterConstants.loginView,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: RouterConstants.registerView,
        builder: (context, state) => const RegisterView(),
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
      GoRoute(
        path: RouterConstants.setupView,
        builder: (context, state) => const SetupView(),
      ),
      GoRoute(
        path: RouterConstants.genderChooseView,
        builder: (context, state) => const GenderChooseView(),
      ),
      GoRoute(
        path: RouterConstants.howOldView,
        builder: (context, state) => const HowOldView(),
      ),
      GoRoute(
        path: RouterConstants.weightSelectView,
        builder: (context, state) => const WeightSelectView(),
      ),
      GoRoute(
        path: RouterConstants.heightSelectView,
        builder: (context, state) => const HeightSelectView(),
      ),
      GoRoute(
        path: RouterConstants.physicalActivityView,
        builder: (context, state) => const PhysicalActivityView(),
      ),
      GoRoute(
        path: RouterConstants.createProfileView,
        builder: (context, state) => const CreateProfileView(),
      ),
      GoRoute(
        path: RouterConstants.homeView,
        builder: (context, state) => const HomeView(),
      ),
    ],
  );
}
