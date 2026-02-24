import 'package:fitness_app/core/constants/app_constants.dart';
import 'package:fitness_app/core/enums/fitness_goal.dart';
import 'package:fitness_app/core/route/router_constants.dart';
import 'package:fitness_app/core/widgets/custom_outlined_button.dart';
import 'package:fitness_app/core/widgets/selection_option_card.dart';
import 'package:fitness_app/feature/setup/presentation/cubit/setup_cubit.dart';
import 'package:fitness_app/feature/setup/presentation/cubit/setup_state.dart';
import 'package:fitness_app/feature/setup/presentation/widgets/header_section.dart';
import 'package:fitness_app/feature/setup/presentation/widgets/setup_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class GoalView extends StatefulWidget {
  const GoalView({super.key});

  @override
  State<GoalView> createState() => _GoalViewState();
}

class _GoalViewState extends State<GoalView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SetupCubit, SetupState>(
      builder: (context, state) {
        return Scaffold(
          appBar: const SetupAppBar(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: HeaderSection(
                    title: 'What Is Your Goal',
                    description: AppConstants.setupDescription,
                  ),
                ),
                Container(
                  width: double.infinity,
                  color: AppConstants.authPurple,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Column(
                    children: FitnessGoal.values
                        .map(
                          (goal) => SelectionOptionCard(
                            label: goal.displayName,
                            isSelected: state.goal == goal,
                            onTap: () =>
                                context.read<SetupCubit>().selectGoal(goal),
                          ),
                        )
                        .toList(),
                  ),
                ),
                SizedBox(height: 16.h),
                CustomOutlinedButton(
                  text: AppConstants.continueTex,
                  onTap: () => GoRouter.of(context)
                      .push(RouterConstants.physicalActivityView),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
