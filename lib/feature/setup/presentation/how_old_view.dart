import 'package:fitness_app/core/constants/app_constants.dart';
import 'package:fitness_app/core/mixins/setup_mixin.dart';
import 'package:fitness_app/core/route/router_constants.dart';
import 'package:fitness_app/feature/setup/presentation/cubit/setup_cubit.dart';
import 'package:fitness_app/feature/setup/presentation/widgets/header_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class HowOldView extends StatefulWidget {
  const HowOldView({super.key});

  @override
  State<HowOldView> createState() => _HowOldViewState();
}

class _HowOldViewState extends State<HowOldView>
    with SetupPageMixin<HowOldView> {
  late FixedExtentScrollController _scrollController;
  int _selectedAge = 28;

  @override
  void initState() {
    super.initState();
    _scrollController = FixedExtentScrollController(initialItem: 18);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  VoidCallback? get onContinue => () async {
        context.read<SetupCubit>().selectAge(_selectedAge);
        await GoRouter.of(context).push(RouterConstants.weightSelectView);
      };

  @override
  Widget buildPageContent() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const HeaderSection(
            title: AppConstants.howOldTitle,
            description: AppConstants.setupDescription,
          ),
          SizedBox(height: 16.h),
          Text(
            '$_selectedAge',
            style: TextStyle(
              color: Colors.white,
              fontSize: 60.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Icon(
            Icons.arrow_drop_up,
            color: AppConstants.authAccent,
            size: 60.sp,
          ),
          SizedBox(height: 20.h),
          AgeSelection(
            selectedAge: _selectedAge,
            scrollController: _scrollController,
            onAgeChanged: (newAge) => setState(() => _selectedAge = newAge),
          ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}

class AgeSelection extends StatelessWidget {
  const AgeSelection({
    required this.selectedAge,
    required this.scrollController,
    required this.onAgeChanged,
    super.key,
  });
  final int selectedAge;
  final FixedExtentScrollController scrollController;
  final ValueChanged<int> onAgeChanged;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 80.h,
            width: double.infinity,
            color: AppConstants.authPurple.withValues(alpha: 0.5),
          ),
          SizedBox(
            height: 100.h,
            child: RotatedBox(
              quarterTurns: -1,
              child: ListWheelScrollView.useDelegate(
                controller: scrollController,
                itemExtent: 80.w,
                physics: const FixedExtentScrollPhysics(),
                onSelectedItemChanged: (index) {
                  onAgeChanged(index + 10);
                },
                childDelegate: ListWheelChildBuilderDelegate(
                  builder: (context, index) {
                    final age = index + 10;
                    final isSelected = age == selectedAge;
                    return RotatedBox(
                      quarterTurns: 1,
                      child: Center(
                        child: Text(
                          "$age",
                          style: TextStyle(
                            fontSize: isSelected ? 35.sp : 25.sp,
                            color: isSelected ? Colors.white : Colors.white38,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                    );
                  },
                  childCount: 81,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: (1.sw - 110.w) / 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildVerticalDivider(),
                _buildVerticalDivider(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVerticalDivider() {
    return Container(
      width: 1.w,
      height: 100.h,
      color: Colors.white,
    );
  }
}
