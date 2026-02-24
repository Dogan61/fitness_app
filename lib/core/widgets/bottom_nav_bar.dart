import 'package:fitness_app/core/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      color: AppConstants.authPurple,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(Icons.home, color: AppConstants.authAccent, size: 32.sp),
          Icon(Icons.fitness_center, color: AppConstants.cWhite, size: 32.sp),
          Icon(Icons.person, color: AppConstants.cWhite, size: 32.sp),
          Icon(Icons.person, color: AppConstants.cWhite, size: 32.sp),
        ],
      ),
    );
  }
}
