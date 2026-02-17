import 'package:fitness_app/core/constants/app_constants.dart';
import 'package:fitness_app/widgets/auth_app_bar.dart';
import 'package:flutter/material.dart';
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
        localizedReason:
            'Please authenticate to continue', // İstersen bunu da constant’a alırız
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: true,
        ),
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
          _buildButton(
            AppConstants.fingerprintSkip,
            onPressed: () {
              Navigator.of(context).maybePop();
            },
          ),
          const SizedBox(height: 20),
          _buildButton(
            AppConstants.fingerprintContinue,
            onPressed: () => _authenticate(context),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(
    String text, {
    required VoidCallback onPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(double.infinity, 55),
          side: const BorderSide(color: Colors.white30, width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: Colors.transparent,
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

