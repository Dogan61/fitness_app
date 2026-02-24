
import 'package:fitness_app/core/constants/app_constants.dart';
import 'package:fitness_app/core/extension/dart_extension.dart';
import 'package:flutter/material.dart';

class HomeCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeCustomAppBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      titleSpacing: 20,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 12),
          Text(
            AppConstants.homeWelcome,
            style: context.theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppConstants.authPurple,
            ),
          ),
          Text(
            AppConstants.appBarDescription,
            style: context.theme.textTheme.bodySmall?.copyWith(
              color: AppConstants.cWhite,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search, color: AppConstants.authPurple),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications,
            color: AppConstants.authPurple,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.person, color: AppConstants.authPurple),
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}
