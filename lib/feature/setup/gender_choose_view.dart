import 'package:fitness_app/core/constants/app_constants.dart';
import 'package:fitness_app/core/extension/dart_extension.dart';
import 'package:fitness_app/core/route/router_constants.dart';
import 'package:fitness_app/core/widgets/custom_outlined_button.dart';
import 'package:fitness_app/feature/setup/widgets/setup_app_Bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class GenderChooseView extends StatefulWidget {
  const GenderChooseView({super.key});

  @override
  State<GenderChooseView> createState() => _GenderChooseViewState();
}

class _GenderChooseViewState extends State<GenderChooseView> {
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.authBackground,
      appBar: const SetupAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 12.h),
            Text(
              'What’s Your Gender',
              style: context.theme.textTheme.headlineMedium?.copyWith(
                color: AppConstants.cWhite,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.h),
              color: AppConstants.authPurple,
              child: Text(
                AppConstants.setupDescription,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppConstants.cBlack,
                  fontSize: 13.sp,
                ),
              ),
            ),
            SizedBox(height: 40.h),
            _BuildGenderOption(
              label: AppConstants.male,
              icon: Icons.male,
              isSelected: selectedGender == AppConstants.male,
              onTap: () => setState(() => selectedGender = AppConstants.male),
            ),
            SizedBox(height: 30.h),
            _BuildGenderOption(
              label: AppConstants.female,
              icon: Icons.female,
              isSelected: selectedGender == AppConstants.female,
              onTap: () => setState(() => selectedGender = AppConstants.female),
            ),
            SizedBox(height: 24.h),
            CustomOutlinedButton(
              text: "Continue",
              onTap: () async {
                await GoRouter.of(context).push(RouterConstants.howOldView);
              },
            ),
            //
          ],
        ),
      ),
    );
  }
}

class _BuildGenderOption extends StatelessWidget {
  const _BuildGenderOption({
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });
  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: 120.w,
            height: 120.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected
                  ? AppConstants.authAccent
                  : Colors.grey.withOpacity(0.1),
              border: Border.all(
                color: isSelected
                    ? AppConstants.authAccent
                    : AppConstants.cWhite,
              ),
            ),
            child: Icon(
              icon,
              size: 70.sp,
              color: isSelected ? Colors.black : AppConstants.cWhite,
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            label,
            style: TextStyle(
              color: AppConstants.cWhite,
              fontSize: 18.sp,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
