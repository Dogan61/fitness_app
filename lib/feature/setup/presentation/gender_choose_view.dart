import 'package:fitness_app/core/constants/app_constants.dart';
import 'package:fitness_app/core/enums/gender.dart';
import 'package:fitness_app/core/extension/dart_extension.dart';
import 'package:fitness_app/core/mixins/setup_mixin.dart';
import 'package:fitness_app/core/route/router_constants.dart';
import 'package:fitness_app/core/widgets/selection_option_card.dart';
import 'package:fitness_app/feature/setup/presentation/cubit/setup_cubit.dart';
import 'package:fitness_app/feature/setup/presentation/cubit/setup_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class GenderChooseView extends StatefulWidget {
  const GenderChooseView({super.key});

  @override
  State<GenderChooseView> createState() => _GenderChooseViewState();
}

class _GenderChooseViewState extends State<GenderChooseView>
    with SetupPageMixin<GenderChooseView> {
  @override
  VoidCallback? get onContinue => () async {
        await GoRouter.of(context).push(RouterConstants.howOldView);
      };

  @override
  Widget buildPageContent() {
    return BlocBuilder<SetupCubit, SetupState>(
      builder: (context, state) {
        return Column(
          children: [
            SizedBox(height: 12.h),
            Text(
              "What's Your Gender",
              style: context.theme.textTheme.headlineMedium?.copyWith(
                color: AppConstants.cWhite,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.h),
            _GenderDescriptionBanner(),
            SizedBox(height: 40.h),
            ...Gender.values.map(
              (gender) => SelectionOptionCard(
                label: gender.displayName,
                icon: gender == Gender.male ? Icons.male : Icons.female,
                isSelected: state.gender == gender,
                style: SelectionCardStyle.circle,
                onTap: () =>
                    context.read<SetupCubit>().selectGender(gender),
              ),
            ),
            SizedBox(height: 24.h),
          ],
        );
      },
    );
  }
}

class _GenderDescriptionBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.h),
      color: AppConstants.authPurple,
      child: Text(
        AppConstants.setupDescription,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppConstants.cBlack,
          fontSize: 13.sp,
        ),
      ),
    );
  }
}
