import 'package:fitness_app/core/constants/app_constants.dart';
import 'package:fitness_app/core/route/router_constants.dart';
import 'package:fitness_app/core/widgets/custom_outlined_button.dart';
import 'package:fitness_app/feature/setup/widgets/build_height_display.dart';
import 'package:fitness_app/feature/setup/widgets/header_section.dart';
import 'package:fitness_app/feature/setup/widgets/height_ruler_section.dart';
import 'package:fitness_app/feature/setup/widgets/setup_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class HeightSelectView extends StatefulWidget {
  const HeightSelectView({super.key});

  @override
  State<HeightSelectView> createState() => _HeightSelectViewState();
}

class _HeightSelectViewState extends State<HeightSelectView> {
  int selectedHeight = 150;
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: const Column(
                children: [
                  HeaderSection(
                    title: AppConstants.whatIsYourHeight,
                    description: AppConstants.setupDescription,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  "  $selectedHeight",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 48.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 8.w),
                Text(
                  "Cm",
                  style: TextStyle(color: Colors.white, fontSize: 20.sp),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 40.h, top: 8.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BuildHeightDisplay(
                    onTap: () {},
                    selectedHeight: selectedHeight,
                    height: 280.h,
                  ),
                  SizedBox(width: 20.w),
                  HeightRulerSection(
                    scrollController: _scrollController,
                    onHeightChanged: (height) {
                      setState(() {
                        selectedHeight = height;
                      });
                    },
                    selectedHeight: selectedHeight,
                  ),
                  Icon(
                    Icons.arrow_left,
                    color: AppConstants.authAccent,
                    size: 40.sp,
                  ),
                ],
              ),
            ),
            SizedBox(height: 32.h),
            CustomOutlinedButton(
              text: "Continue",
              onTap: () async {
                await GoRouter.of(
                  context,
                ).push(RouterConstants.physicalActivityView);
              },
            ),
          ],
        ),
      ),
    );
  }
}
