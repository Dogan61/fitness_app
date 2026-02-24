import 'package:fitness_app/core/constants/app_constants.dart';
import 'package:fitness_app/core/enums/activity_level.dart';
import 'package:fitness_app/core/mixins/setup_mixin.dart';
import 'package:fitness_app/core/route/router_constants.dart';
import 'package:fitness_app/core/widgets/selection_option_card.dart';
import 'package:fitness_app/feature/setup/presentation/cubit/setup_cubit.dart';
import 'package:fitness_app/feature/setup/presentation/cubit/setup_state.dart';
import 'package:fitness_app/feature/setup/presentation/widgets/header_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class PhysicalActivityView extends StatefulWidget {
  const PhysicalActivityView({super.key});

  @override
  State<PhysicalActivityView> createState() => _PhysicalActivityViewState();
}

class _PhysicalActivityViewState extends State<PhysicalActivityView>
    with SetupPageMixin<PhysicalActivityView> {
  @override
  VoidCallback? get onContinue => () async {
        await GoRouter.of(context).push(RouterConstants.createProfileView);
      };

  @override
  Widget buildPageContent() {
    return BlocBuilder<SetupCubit, SetupState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              const HeaderSection(
                title: AppConstants.setupGoalTitle,
                description: AppConstants.setupDescription,
              ),
              SizedBox(height: 32.h),
              ...ActivityLevel.values.map(
                (level) => SelectionOptionCard(
                  label: level.displayName,
                  isSelected: state.activityLevel == level,
                  style: SelectionCardStyle.flat,
                  onTap: () =>
                      context.read<SetupCubit>().selectActivityLevel(level),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
