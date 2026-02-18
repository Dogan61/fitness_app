import 'package:fitness_app/core/constants/app_constants.dart';
import 'package:fitness_app/core/extension/dart_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SetupAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SetupAppBar({
    this.text = "Back",
    super.key,
    this.onBack,
  });
  final VoidCallback? onBack;
  final String text;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final iconColor = context.theme.appBarTheme.iconTheme?.color;
    return AppBar(
      leadingWidth: 100.w,
      leading: Padding(
        padding: EdgeInsets.only(left: 24.w),
        child: InkWell(
          onTap: onBack ?? () => Navigator.pop(context),
          child: Row(
            children: [
              Icon(
                Icons.arrow_back_ios_new_outlined,
                color: iconColor,
                size: 16,
              ),
              SizedBox(width: 8.w),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppConstants.authAccent,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
