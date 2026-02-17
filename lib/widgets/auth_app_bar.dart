import 'package:fitness_app/core/extension/dart_extension.dart';
import 'package:flutter/material.dart';

class AuthAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AuthAppBar({
    super.key,
    required this.title,
    this.showBack = true,
    this.onBack,
  });

  final String title;
  final bool showBack;
  final VoidCallback? onBack;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final iconColor = context.theme.appBarTheme.iconTheme?.color;
    return AppBar(
      leading: showBack
          ? IconButton(
              icon: Icon(
                Icons.arrow_left,
                color: iconColor,
                size: 40,
              ),
              onPressed: onBack ?? () => Navigator.of(context).maybePop(),
            )
          : null,
      title: Text(title),
    );
  }
}

