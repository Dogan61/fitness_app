import 'package:flutter/material.dart';
import 'package:fitness_app/core/constants/app_constants.dart';

class AuthSocialIcon extends StatelessWidget {
  const AuthSocialIcon({
    super.key,
    required this.icon,
  });

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 25,
      backgroundColor: Colors.white,
      child: Icon(
        icon,
        color: AppConstants.authPurple,
        size: 30,
      ),
    );
  }
}

