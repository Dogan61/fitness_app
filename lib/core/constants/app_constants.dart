import 'package:flutter/material.dart';

/// Uygulama genelinde kullanılan ortak renk ve metin sabitleri
class AppConstants {
  AppConstants._();

  // Colors
  static const Color authBackground = Color(0xFF1E1E1E);
  static const Color authAccent = Color(0xFFE5F876);
  static const Color authPurple = Color(0xFFB4A7FB);

  // Auth common strings
  static const String authLorem =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.';

  // Login
  static const String loginTitle = 'Log In';
  static const String loginWelcome = 'Welcome';
  static const String loginDescription = authLorem;
  static const String loginUsernameLabel = 'Username or email';
  static const String loginUsernameHint = 'example@example.com';
  static const String loginPasswordLabel = 'Password';
  static const String loginPasswordHint = '**************';
  static const String loginButton = 'Log In';
  static const String loginForgotPassword = 'Forgot Password?';
  static const String loginOrSignUpWith = 'or sign up with';
  static const String loginDontHaveAccount = "Don't have an account? ";
  static const String loginSignUp = 'Sign Up';

  // Register
  static const String registerTitle = 'Create Account';
  static const String registerStart = "Let's Start!";
  static const String registerFullName = 'Full name';
  static const String registerEmailOrPhone = 'Email or Mobile Number';
  static const String registerPassword = 'Password';
  static const String registerConfirmPassword = 'Confirm Password';
  static const String registerButton = 'Sign Up';
  static const String registerOrSignUpWith = 'or sign up with';
  static const String registerAlreadyHaveAccount = 'Already have an account? ';
  static const String registerLogin = 'Log In';
  static const String registerTermsPrefix = 'By continuing, you agree to\n';
  static const String registerTermsOfUse = 'Terms of Use';
  static const String registerPrivacyPolicy = 'Privacy Policy.';

  // Forgot password
  static const String forgotPasswordTitle = 'Forgotten Password';
  static const String forgotPasswordHeader = 'Forgot Password?';
  static const String forgotPasswordDescription = authLorem;
  static const String forgotPasswordEnterEmail = 'Enter your email address';
  static const String forgotPasswordEmailHint = 'example@example.com';
  static const String forgotPasswordContinue = 'Continue';

  // Set password
  static const String setPasswordTitle = 'Set Password';
  static const String setPasswordDescription = authLorem;
  static const String setPasswordPassword = 'Password';
  static const String setPasswordConfirmPassword = 'Confirm Password';
  static const String setPasswordButton = 'Reset Password';

  // Set fingerprint
  static const String fingerprintTitle = 'Set Your Fingerprint';
  static const String fingerprintDescription =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.';
  static const String fingerprintSkip = 'Skip';
  static const String fingerprintContinue = 'Continue';
  static const String fingerprintNotSupported =
      'Fingerprint is not available on this device.';
  static const String fingerprintAuthFailed =
      'Fingerprint authentication failed.';
  static const String fingerprintAuthSuccess =
      'Fingerprint set successfully.';
}

