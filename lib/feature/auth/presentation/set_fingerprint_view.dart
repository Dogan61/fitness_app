import 'package:fitness_app/core/constants/app_constants.dart';
import 'package:fitness_app/core/route/router_constants.dart';
import 'package:fitness_app/core/widgets/custom_outlined_button.dart';
import 'package:fitness_app/feature/auth/presentation/widgets/auth_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:local_auth/local_auth.dart';

class SetFingerprintScreen extends StatelessWidget {
  const SetFingerprintScreen({super.key});

  Future<void> _authenticate(BuildContext context) async {
    final localAuth = LocalAuthentication();

    try {
      final isSupported = await localAuth.isDeviceSupported();
      final canCheck = await localAuth.canCheckBiometrics;

      if (!isSupported || !canCheck) {
        _showMessage(context, AppConstants.fingerprintNotSupported);
        return;
      }

      final didAuthenticate = await localAuth.authenticate(
        localizedReason: 'Please authenticate to continue',
        biometricOnly: true,
        persistAcrossBackgrounding: true,
      );

      if (didAuthenticate) {
        _showMessage(context, AppConstants.fingerprintAuthSuccess);
        // TODO: Başarılı durumda gerekli state / navigation işlemleri
      } else {
        _showMessage(context, AppConstants.fingerprintAuthFailed);
      }
    } catch (e) {
      _showMessage(context, AppConstants.fingerprintAuthFailed);
    }
  }

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.authBackground,
      appBar: const AuthAppBar(title: AppConstants.fingerprintTitle),
      body: Column(
        children: [
          const SizedBox(height: 40),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              AppConstants.fingerprintDescription,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
                height: 1.4,
              ),
            ),
          ),
          const SizedBox(height: 40),
          Container(
            width: double.infinity,
            height: 300,
            decoration: const BoxDecoration(
              color: AppConstants.authPurple,
            ),
            child: const Center(
              child: Icon(
                Icons.fingerprint,
                size: 200,
                color: Colors.white,
              ),
            ),
          ),

          const SizedBox(height: 60),
          CustomOutlinedButton(
            text: AppConstants.fingerprintSkip,
            onTap: () => {
              GoRouter.of(context).push(RouterConstants.setupView),
            },
          ),
          const SizedBox(height: 20),
          CustomOutlinedButton(
            text: AppConstants.fingerprintContinue,
            onTap: () => _authenticate(context),
          ),
        ],
      ),
    );
  }
}
