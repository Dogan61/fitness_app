import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildHeightDisplay extends StatelessWidget {
  const BuildHeightDisplay({
    required this.onTap,
    required this.selectedHeight,
    required this.height,
    super.key,
  });
  final VoidCallback onTap;
  final int selectedHeight;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(5, (index) {
          final weight = selectedHeight - 2 + index;
          final isCenter = weight == selectedHeight;
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
    );
  }
}
