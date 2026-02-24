import 'package:fitness_app/core/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeightRulerSection extends StatelessWidget {
  const HeightRulerSection({
    required this.scrollController,
    required this.onHeightChanged,
    required this.selectedHeight,
    super.key,
  });

  final FixedExtentScrollController scrollController;
  final ValueChanged<int> onHeightChanged;
  final int selectedHeight;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        Container(
          height: 280.h,
          width: 80.w,
          decoration: BoxDecoration(
            color: AppConstants.authPurple,
            borderRadius: BorderRadius.circular(16.r),
          ),
        ),
        SizedBox(
          height: 280.h,
          width: 80.w,
          child: ListWheelScrollView.useDelegate(
            controller: scrollController,
            itemExtent: 20.h,
            physics: const FixedExtentScrollPhysics(),
            overAndUnderCenterOpacity: 0.5,
            onSelectedItemChanged: (index) {
              onHeightChanged(index + 100);
            },
            childDelegate: ListWheelChildBuilderDelegate(
              builder: (context, index) {
                final isSelected = (index + 100) == selectedHeight;
                final isLong = index % 10 == 0;
                return Center(
                  child: Container(
                    width: isLong ? 40.w : 20.w,
                    height: 2.h,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppConstants.authAccent
                          : (isLong
                                ? AppConstants.authAccent
                                : AppConstants.cWhite),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                );
              },
              childCount: 151,
            ),
          ),
        ),
      ],
    );
  }
}
