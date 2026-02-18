import 'package:fitness_app/core/constants/app_constants.dart';
import 'package:fitness_app/core/route/router_constants.dart';
import 'package:fitness_app/core/widgets/custom_outlined_button.dart';
import 'package:fitness_app/feature/setup/widgets/build_weight_display.dart';
import 'package:fitness_app/feature/setup/widgets/header_section.dart';
import 'package:fitness_app/feature/setup/widgets/setup_app_bar.dart';
import 'package:fitness_app/feature/setup/widgets/weight_ruler_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class WeightSelectView extends StatefulWidget {
  const WeightSelectView({super.key});

  @override
  State<WeightSelectView> createState() => _WeightSelectViewState();
}

class _WeightSelectViewState extends State<WeightSelectView> {
  int selectedWeight = 75;
  bool isKg = true;
  late FixedExtentScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = FixedExtentScrollController(initialItem: 45);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.authBackground,
      appBar: const SetupAppBar(),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: const Column(
              children: [
                HeaderSection(
                  title: AppConstants.whatIsYourWeight,
                  description: AppConstants.setupDescription,
                ),
              ],
            ),
          ),
          SizedBox(height: 24.h),
          _buildUnitToggle(),
          SizedBox(height: 24.h),
          BuildWeightDisplay(onTap: () {}, selectedWeight: selectedWeight),
          WeightRulerSection(
            scrollController: _scrollController,
            onWeightChanged: (weight) {
              setState(() {
                selectedWeight = weight;
              });
            },
          ),
          WeightSelectionSection(selectedWeight: selectedWeight, isKg: isKg),
          const Spacer(),
          CustomOutlinedButton(
            text: "Continue",
            onTap: () =>
                GoRouter.of(context).push(RouterConstants.heightSelectView),
          ),
          SizedBox(height: 32.h),
        ],
      ),
    );
  }

  Widget _buildUnitToggle() {
    return Container(
      width: 280.w,
      height: 50.h,
      decoration: BoxDecoration(
        color: AppConstants.authAccent,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Row(
        children: [
          _unitButton("KG", isKg, () => setState(() => isKg = true)),
          const VerticalDivider(
            color: Colors.black45,
            thickness: 1,
            indent: 10,
            endIndent: 10,
          ),
          _unitButton(
            "LB",
            !isKg,
            () => setState(
              () => isKg = false,
            ),
          ),
        ],
      ),
    );
  }

  Widget _unitButton(String label, bool active, VoidCallback onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: Colors.black,
              fontWeight: active ? FontWeight.bold : FontWeight.normal,
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
