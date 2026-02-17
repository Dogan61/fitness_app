import 'package:fitness_app/core/route/router_constants.dart';
import 'package:fitness_app/feature/auth/forgot_password_view.dart';
import 'package:fitness_app/feature/auth/login_view.dart';
import 'package:fitness_app/feature/auth/register_view.dart';
import 'package:fitness_app/feature/auth/set_fingerprint_view.dart';
import 'package:fitness_app/feature/auth/set_password_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter._();
  static final GoRouter router = GoRouter(
    initialLocation: RouterConstants.login,
    routes: [
      GoRoute(
        path: RouterConstants.login,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: RouterConstants.register,
        builder: (context, state) => const RegisterView(),
      ),
      GoRoute(
        path: RouterConstants.forgotPassword,
        builder: (context, state) => const ForgotPasswordView(),
      ),
      GoRoute(
        path: RouterConstants.setPasswordView,
        builder: (context, state) => const SetPasswordView(),
      ),
      GoRoute(
        path: RouterConstants.setFingerprint,
        builder: (context, state) => const SetFingerprintScreen(),
      ),
    ],
  );
}
