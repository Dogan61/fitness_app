import 'package:fitness_app/core/constants/app_constants.dart';
import 'package:fitness_app/core/enums/home_category.dart';
import 'package:fitness_app/feature/home/presentation/cubit/home_cubit.dart';
import 'package:fitness_app/feature/home/presentation/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          previous.selectedCategory != current.selectedCategory,
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h),
          child: SizedBox(
            height: 80.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: HomeCategory.values.length,
              itemBuilder: (context, index) {
                final category = HomeCategory.values[index];
                return Row(
                  children: [
                    CategoryField(
                      category: category,
                      isSelected: state.selectedCategory == category,
                      onTap: () =>
                          context.read<HomeCubit>().selectCategory(category),
                    ),
                    if (index != HomeCategory.values.length - 1)
                      VerticalDivider(
                        color: AppConstants.authPurple,
                        thickness: 1,
                        indent: 1.w,
                        endIndent: 12.w,
                      ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class CategoryField extends StatelessWidget {
  const CategoryField({
    required this.category,
    required this.isSelected,
    required this.onTap,
    super.key,
  });

  final HomeCategory category;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 70.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              category.icon,
              size: 36.sp,
              color: isSelected
                  ? AppConstants.authAccent
                  : AppConstants.authPurple,
            ),
            SizedBox(height: 8.h),
            Text(
              category.displayName,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: isSelected
                    ? AppConstants.authAccent
                    : AppConstants.authPurple,
                fontSize: 11.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
