part of '../setup_view.dart';

class SetupViewContent extends StatelessWidget {
  const SetupViewContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30.h),
        Text(
          AppConstants.setupTitle,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppConstants.authAccent,
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(20.w),
          decoration: const BoxDecoration(
            color: AppConstants.authPurple,
          ),
          child: Text(
            AppConstants.setupDescription,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppConstants.cBlack,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(height: 40.h),

        CustomOutlinedButton(
          text: 'Next',
          onTap: () =>
              GoRouter.of(context).push(RouterConstants.genderChooseView),
        ),
      ],
    );
  }
}
