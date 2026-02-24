import 'dart:async';

import 'package:fitness_app/core/constants/app_constants.dart';
import 'package:fitness_app/core/mixins/setup_mixin.dart';
import 'package:fitness_app/core/route/router_constants.dart';
import 'package:fitness_app/feature/setup/presentation/cubit/setup_cubit.dart';
import 'package:fitness_app/feature/setup/presentation/widgets/build_weight_display.dart';
import 'package:fitness_app/feature/setup/presentation/widgets/header_section.dart';
import 'package:fitness_app/feature/setup/presentation/widgets/weight_ruler_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class WeightSelectView extends StatefulWidget {
  const WeightSelectView({super.key});

  @override
  State<WeightSelectView> createState() => _WeightSelectViewState();
}

class _WeightSelectViewState extends State<WeightSelectView>
    with SetupPageMixin<WeightSelectView> {
  int _selectedWeight = 75;
  bool _isKg = true;
  late FixedExtentScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = FixedExtentScrollController(initialItem: 45);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  VoidCallback? get onContinue => () {
        context.read<SetupCubit>().selectWeight(_selectedWeight.toDouble());
        unawaited(
          GoRouter.of(context).push(RouterConstants.heightSelectView),
        );
      };

  @override
  Widget buildPageContent() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: const HeaderSection(
            title: AppConstants.whatIsYourWeight,
            description: AppConstants.setupDescription,
          ),
        ),
        SizedBox(height: 24.h),
        _UnitToggle(
          isKg: _isKg,
          onToggle: (value) => setState(() => _isKg = value),
        ),
        SizedBox(height: 24.h),
        BuildWeightDisplay(onTap: () {}, selectedWeight: _selectedWeight),
        WeightRulerSection(
          scrollController: _scrollController,
          onWeightChanged: (weight) => setState(() => _selectedWeight = weight),
        ),
        WeightSelectionSection(
          selectedWeight: _selectedWeight,
          isKg: _isKg,
        ),
        SizedBox(height: 32.h),
      ],
    );
  }
}

class _UnitToggle extends StatelessWidget {
  const _UnitToggle({required this.isKg, required this.onToggle});
  final bool isKg;
  final ValueChanged<bool> onToggle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280.w,
      height: 50.h,
      decoration: BoxDecoration(
        color: AppConstants.authAccent,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Row(
        children: [
          _UnitButton(
            label: 'KG',
            isActive: isKg,
            onTap: () => onToggle(true),
          ),
          const VerticalDivider(
            color: Colors.black45,
            thickness: 1,
            indent: 10,
            endIndent: 10,
          ),
          _UnitButton(
            label: 'LB',
            isActive: !isKg,
            onTap: () => onToggle(false),
          ),
        ],
      ),
    );
  }
}

class _UnitButton extends StatelessWidget {
  const _UnitButton({
    required this.label,
    required this.isActive,
    required this.onTap,
  });
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: Colors.black,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              fontSize: 16.sp,
            ),
          ),
        ),
      ),
    );
  }
}

class WeightSelectionSection extends StatelessWidget {
  const WeightSelectionSection({
    required this.selectedWeight,
    required this.isKg,
    super.key,
  });

  final int selectedWeight;
  final bool isKg;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.arrow_drop_up,
          color: AppConstants.authAccent,
          size: 60.sp,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              "   $selectedWeight",
              style: TextStyle(
                color: Colors.white,
                fontSize: 48.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 8.w),
            Text(
              isKg ? "Kg" : "Lb",
              style: TextStyle(color: Colors.white, fontSize: 20.sp),
            ),
          ],
        ),
      ],
    );
  }
}
