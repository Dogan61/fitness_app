import 'package:fitness_app/core/widgets/bottom_nav_bar.dart';
import 'package:fitness_app/core/widgets/section_title_widget.dart';
import 'package:fitness_app/feature/home/presentation/cubit/home_cubit.dart';
import 'package:fitness_app/feature/home/presentation/cubit/home_state.dart';
import 'package:fitness_app/feature/home/presentation/widgets/category_section.dart';
import 'package:fitness_app/feature/home/presentation/widgets/exercise_section.dart';
import 'package:fitness_app/feature/home/presentation/widgets/home_articles_section.dart';
import 'package:fitness_app/feature/home/presentation/widgets/home_custom_app_bar.dart';
import 'package:fitness_app/feature/home/presentation/widgets/home_middle_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeCustomAppBar(),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CategorySection(),
                SizedBox(height: 8.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: SectionTitle(
                    title: 'Recommendation',
                    actionLabel: 'See All',
                    onActionTap: () {},
                  ),
                ),
                SizedBox(height: 12.h),
                if (state.exercises.isNotEmpty)
                  ExerciseSection(exercises: state.exercises)
                else
                  const _ExercisePlaceholder(),
                SizedBox(height: 12.h),
                const HomeMiddleBanner(),
                if (state.articles.isNotEmpty)
                  HomeArticlesSection(articles: state.articles)
                else
                  const _ArticlesPlaceholder(),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}

class _ExercisePlaceholder extends StatelessWidget {
  const _ExercisePlaceholder();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          _StaticExerciseCard(
            assetPath: 'assets/images/ic_training_1.png',
            cardTitle: 'Full Body Workout',
            durationLabel: '12 Min',
            caloriesLabel: '120 Kcal',
          ),
          _StaticExerciseCard(
            assetPath: 'assets/images/ic_training_2.png',
            cardTitle: 'Cardio Training',
            durationLabel: '15 Min',
            caloriesLabel: '150 Kcal',
          ),
        ],
      ),
    );
  }
}

class _StaticExerciseCard extends StatelessWidget {
  const _StaticExerciseCard({
    required this.assetPath,
    required this.cardTitle,
    required this.durationLabel,
    required this.caloriesLabel,
  });

  final String assetPath;
  final String cardTitle;
  final String durationLabel;
  final String caloriesLabel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E1E),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.8),
            width: 1.5,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(14.5)),
              child: Image.asset(
                assetPath,
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                cardTitle,
                style: const TextStyle(
                  color: Color(0xFFE2F163),
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ArticlesPlaceholder extends StatelessWidget {
  const _ArticlesPlaceholder();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16.w,
        right: 16.w,
        top: 16.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(title: 'Articles & Tips'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildArticleCard('assets/images/ic_articles_1.png',
                  'Supplement Guide...', true),
              const SizedBox(width: 16),
              _buildArticleCard('assets/images/ic_articles_1.png',
                  '15 Quick & Effective Daily Routines...', false),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildArticleCard(
      String imagePath, String title, bool isFavorite) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(28),
              child: Image.asset(
                imagePath,
                width: 160,
                height: 140,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 12,
              right: 12,
              child: Icon(
                Icons.star,
                color: isFavorite
                    ? Colors.limeAccent
                    : Colors.white.withValues(alpha: 0.8),
                size: 26,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: 150,
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              height: 1.2,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
