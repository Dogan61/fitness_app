import 'package:fitness_app/core/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum SelectionCardStyle { rounded, circle, flat }

class SelectionOptionCard extends StatelessWidget {
  const SelectionOptionCard({
    required this.label,
    required this.isSelected,
    required this.onTap,
    super.key,
    this.icon,
    this.style = SelectionCardStyle.rounded,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final IconData? icon;
  final SelectionCardStyle style;

  @override
  Widget build(BuildContext context) {
    return switch (style) {
      SelectionCardStyle.circle => _CircleCard(
          label: label,
          isSelected: isSelected,
          onTap: onTap,
          icon: icon,
        ),
      SelectionCardStyle.rounded => _RoundedCard(
          label: label,
          isSelected: isSelected,
          onTap: onTap,
        ),
      SelectionCardStyle.flat => _FlatCard(
          label: label,
          isSelected: isSelected,
          onTap: onTap,
        ),
    };
  }
}

class _CircleCard extends StatelessWidget {
  const _CircleCard({
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.icon,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final IconData? icon;

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
                  : Colors.grey.withValues(alpha: 0.1),
              border: Border.all(
                color:
                    isSelected ? AppConstants.authAccent : AppConstants.cWhite,
              ),
            ),
            child: icon != null
                ? Icon(
                    icon,
                    size: 70.sp,
                    color: isSelected ? Colors.black : AppConstants.cWhite,
                  )
                : null,
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

class _RoundedCard extends StatelessWidget {
  const _RoundedCard({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ]
              : [],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            _SelectionIndicator(isSelected: isSelected),
          ],
        ),
      ),
    );
  }
}

class _FlatCard extends StatelessWidget {
  const _FlatCard({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 18.h),
          decoration: BoxDecoration(
            color: isSelected ? AppConstants.authAccent : AppConstants.cWhite,
            borderRadius: BorderRadius.circular(40.r),
          ),
          child: Center(
            child: Text(
              label,
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

class _SelectionDot extends StatelessWidget {
  const _SelectionDot();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 16,
      height: 16,
      decoration: const BoxDecoration(
        color: AppConstants.authPurple,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _SelectionIndicator extends StatelessWidget {
  const _SelectionIndicator({required this.isSelected});
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? AppConstants.authPurple : Colors.black26,
          width: 2.5,
        ),
      ),
      child: isSelected
          ? Center(
              child: const _SelectionDot(),
            )
          : null,
    );
  }
}
