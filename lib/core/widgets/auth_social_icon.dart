import 'package:fitness_app/core/constants/app_constants.dart';
import 'package:flutter/material.dart';

class AuthSocialIcon extends StatelessWidget {
  const AuthSocialIcon({
    required this.icon,
    super.key,
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
