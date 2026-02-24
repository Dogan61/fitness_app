import 'package:fitness_app/core/constants/app_constants.dart';
import 'package:fitness_app/core/route/router_constants.dart';
import 'package:fitness_app/feature/auth/presentation/widgets/auth_label.dart';
import 'package:fitness_app/feature/auth/presentation/widgets/auth_text_field.dart';
import 'package:fitness_app/feature/setup/presentation/widgets/header_section.dart';
import 'package:fitness_app/feature/setup/presentation/widgets/setup_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CreateProfileView extends StatefulWidget {
  const CreateProfileView({super.key});

  @override
  State<CreateProfileView> createState() => _CreateProfileViewState();
}

class _CreateProfileViewState extends State<CreateProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.authBackground,
      appBar: const SetupAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeaderSection(
              title: AppConstants.fillProfileTitle,
              description: AppConstants.setupDescription,
            ),
            const ProfileImageSection(),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 24.h),
              child: const Column(
                children: [
                  LabeledTextField(
                    label: "Full Name",
                    hintText: "Enter your full name",
                  ),
                  LabeledTextField(
                    label: "Nickname",
                    hintText: "Choose a nickname",
                  ),
                  LabeledTextField(
                    label: "Email",
                    hintText: "example@mail.com",
                    keyboardType: TextInputType.emailAddress,
                  ),
                  LabeledTextField(
                    label: "Mobile Number",
                    hintText: "+90 5XX XXX XX XX",
                    keyboardType: TextInputType.phone,
                    marginBottom:
                        0, // Son eleman olduğu için boşluğu sıfırladık
                  ),
                ],
              ),
            ),
            _CustomStartButton(
              text: "Start",
              onTap: () => GoRouter.of(context).push(RouterConstants.homeView),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileImageSection extends StatelessWidget {
  const ProfileImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      width: double.infinity,
      decoration: const BoxDecoration(color: AppConstants.authPurple),
      child: Center(
        child: SizedBox(
          width: 70.h,
          height: 70.h,
          child: Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Center(child: Icon(Icons.person, size: 40)),
              ),
              Positioned(
                bottom: 0,
                right: -5.h,
                child: Container(
                  height: 30.h,
                  width: 30.h,
                  decoration: const BoxDecoration(
                    color: AppConstants.authAccent,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.edit,
                    size: 16,
                    color: AppConstants.authBackground,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LabeledTextField extends StatelessWidget {
  const LabeledTextField({
    required this.label,
    required this.hintText,
    super.key,
    this.controller,
    this.keyboardType,
    this.marginBottom = 8.0,
  });
  final String label;
  final String hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final double marginBottom;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: marginBottom.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AuthLabel(
            color: AppConstants.authPurple,
            text: label,
          ),
          SizedBox(height: 4.h),
          AuthTextField(
            hintText: hintText,
          ),
        ],
      ),
    );
  }
}

class _CustomStartButton extends StatelessWidget {
  const _CustomStartButton({
    required this.text,
    this.onTap,
  });
  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          side: const BorderSide(color: AppConstants.authAccent, width: 1.5),
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 70,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          backgroundColor: AppConstants.authAccent,
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: AppConstants.cBlack,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
