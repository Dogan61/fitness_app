
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildWeightDisplay extends StatelessWidget {
  const BuildWeightDisplay({
    required this.onTap,
    required this.selectedWeight,
    super.key,
  });
  final VoidCallback onTap;
  final int selectedWeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(5, (index) {
            final weight = selectedWeight - 2 + index;
            final isCenter = weight == selectedWeight;
            return Text(
              "$weight",
              style: TextStyle(
                color: isCenter ? Colors.white : Colors.white24,
                fontSize: isCenter ? 30.sp : 20.sp,
                fontWeight: isCenter ? FontWeight.bold : FontWeight.normal,
              ),
            );
          }),
        ),
      ],
    );
  }
}
