import 'package:fitness_app/core/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeightRulerSection extends StatelessWidget {
  const WeightRulerSection({
    required this.scrollController,
    required this.onWeightChanged,
    super.key,
  });

  final FixedExtentScrollController scrollController;
  final ValueChanged<int> onWeightChanged;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 70.h,
          width: double.infinity,
          color: AppConstants.authPurple.withOpacity(0.5),
        ),
        SizedBox(
          height: 70.h,
          child: RotatedBox(
            quarterTurns: -1,
            child: ListWheelScrollView.useDelegate(
              controller: scrollController,
              itemExtent: 20.w,
              physics: const FixedExtentScrollPhysics(),
              onSelectedItemChanged: (index) {
                onWeightChanged(index + 32);
              },
              childDelegate: ListWheelChildBuilderDelegate(
                builder: (context, index) {
                  final isLong = index % 5 == 0;
                  return RotatedBox(
                    quarterTurns: 1,
                    child: Center(
                      child: Container(
                        width: isLong ? 3.w : 1.w,
                        height: isLong ? 40.h : 20.h,
                        color: isLong ? Colors.white : Colors.white38,
                      ),
                    ),
                  );
                },
                childCount: 169,
              ),
            ),
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 3.w,
              height: 70.h,
              color: AppConstants.authAccent,
            ),
          ],
        ),
      ],
    );
  }
}
