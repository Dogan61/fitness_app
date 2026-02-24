

import 'package:fitness_app/feature/auth/presentation/widgets/auth_social_icon.dart';
import 'package:flutter/material.dart';

class SocialIconSection extends StatelessWidget {
  const SocialIconSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AuthSocialIcon(icon: Icons.g_mobiledata),
        SizedBox(width: 15),
        AuthSocialIcon(icon: Icons.facebook),
        SizedBox(width: 15),
        AuthSocialIcon(icon: Icons.fingerprint),
      ],
    );
  }
}
