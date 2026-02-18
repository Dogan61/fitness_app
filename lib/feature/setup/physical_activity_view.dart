import 'package:fitness_app/core/constants/app_constants.dart';
import 'package:fitness_app/core/route/router_constants.dart';
import 'package:fitness_app/core/widgets/custom_outlined_button.dart';
import 'package:fitness_app/feature/setup/widgets/header_section.dart';
import 'package:fitness_app/feature/setup/widgets/setup_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class PhysicalActivityView extends StatefulWidget {
  const PhysicalActivityView({super.key});

  @override
  State<PhysicalActivityView> createState() => _PhysicalActivityViewState();
}

class _PhysicalActivityViewState extends State<PhysicalActivityView> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.authBackground,
      appBar: const SetupAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  const HeaderSection(
                    title: AppConstants.setupGoalTitle,
                    description: AppConstants.setupDescription,
                  ),
                  SizedBox(height: 32.h),
                  _CustomContainer(
                    text: "Begginer",
                    isSelected: selectedIndex == 0,
                    onTap: () => setState(() => selectedIndex = 0),
                  ),
                  _CustomContainer(
                    text: 'Intermediate',
                    isSelected: selectedIndex == 1,
                    onTap: () => setState(() => selectedIndex = 1),
                  ),
                  _CustomContainer(
                    text: "Advanced",
                    isSelected: selectedIndex == 2,
                    onTap: () => setState(() => selectedIndex = 2),
                  ),
                ],
              ),
            ),
            CustomOutlinedButton(
              text: "Continue",
              onTap: () async {
                await GoRouter.of(
                  context,
                ).push(RouterConstants.createProfileView);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomContainer extends StatelessWidget {
  const _CustomContainer({
    required this.text,
    required this.isSelected,
    required this.onTap,
  });
  final bool isSelected;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            vertical: 18.h,
          ),
          decoration: BoxDecoration(
            color: isSelected ? AppConstants.authAccent : AppConstants.cWhite,
            borderRadius: BorderRadius.circular(40.r),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: isSelected
                    ? AppConstants.cBlack
                    : AppConstants.authPurple,
                fontSize: 18.sp,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
