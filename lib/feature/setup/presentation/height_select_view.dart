import 'package:fitness_app/core/constants/app_constants.dart';
import 'package:fitness_app/core/mixins/setup_mixin.dart';
import 'package:fitness_app/core/route/router_constants.dart';
import 'package:fitness_app/feature/setup/presentation/cubit/setup_cubit.dart';
import 'package:fitness_app/feature/setup/presentation/widgets/build_height_display.dart';
import 'package:fitness_app/feature/setup/presentation/widgets/header_section.dart';
import 'package:fitness_app/feature/setup/presentation/widgets/height_ruler_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class HeightSelectView extends StatefulWidget {
  const HeightSelectView({super.key});

  @override
  State<HeightSelectView> createState() => _HeightSelectViewState();
}

class _HeightSelectViewState extends State<HeightSelectView>
    with SetupPageMixin<HeightSelectView> {
  int _selectedHeight = 150;
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
  VoidCallback? get onContinue => () async {
        context
            .read<SetupCubit>()
            .selectHeight(_selectedHeight.toDouble());
        await GoRouter.of(context).push(RouterConstants.physicalActivityView);
      };

  @override
  Widget buildPageContent() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: const HeaderSection(
            title: AppConstants.whatIsYourHeight,
            description: AppConstants.setupDescription,
          ),
        ),
        _HeightValue(selectedHeight: _selectedHeight),
        Padding(
          padding: EdgeInsets.only(left: 40.h, top: 8.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BuildHeightDisplay(
                onTap: () {},
                selectedHeight: _selectedHeight,
                height: 280.h,
              ),
              SizedBox(width: 20.w),
              HeightRulerSection(
                scrollController: _scrollController,
                onHeightChanged: (height) =>
                    setState(() => _selectedHeight = height),
                selectedHeight: _selectedHeight,
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
      ],
    );
  }
}

class _HeightValue extends StatelessWidget {
  const _HeightValue({required this.selectedHeight});
  final int selectedHeight;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Text(
          '  $selectedHeight',
          style: TextStyle(
            color: Colors.white,
            fontSize: 48.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(width: 8.w),
        Text(
          'Cm',
          style: TextStyle(color: Colors.white, fontSize: 20.sp),
        ),
      ],
    );
  }
}
