import 'package:fitness_app/core/constants/app_constants.dart';
import 'package:fitness_app/core/extension/dart_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeCustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CategorySection(),
            SizedBox(height: 8.h),
            const _ContentTitle(),
            SizedBox(height: 12.h),
            const ExerciseSection(),
            SizedBox(height: 12.h),
            const HomeMiddleBanner(),
            const HomeArticlesSection(),
          ],
        ),
      ),
      bottomNavigationBar: const HomeBottomNavBar(),
    );
  }
}

class HomeArticlesSection extends StatelessWidget {
  const HomeArticlesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Articles & Tips",
            style: TextStyle(
              color: AppConstants.authAccent,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ArticleCard(
                imagePath: "assets/images/ic_articles_1.png",
                title: "Supplement Guide...",
                isFavorite: true,
                onTap: () => print("Makale 1 tıklandı"),
              ),
              const SizedBox(width: 16),
              ArticleCard(
                imagePath: "assets/images/ic_articles_1.png",
                title: "15 Quick & Effective Daily Routines...",
                onTap: () => print("Makale 2 tıklandı"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ArticleCard extends StatelessWidget {
  const ArticleCard({
    required this.imagePath,
    required this.title,
    super.key,
    this.isFavorite = false,
    this.onTap,
  });
  final String imagePath;
  final String title;
  final bool isFavorite;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(
                  28,
                ),
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
                      : Colors.white.withOpacity(0.8),
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
      ),
    );
  }
}

class HomeBottomNavBar extends StatelessWidget {
  const HomeBottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      color: AppConstants.authPurple,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(Icons.home, color: AppConstants.authAccent, size: 32.sp),
          Icon(Icons.fitness_center, color: AppConstants.cWhite, size: 32.sp),
          Icon(Icons.person, color: AppConstants.cWhite, size: 32.sp),
          Icon(Icons.person, color: AppConstants.cWhite, size: 32.sp),
        ],
      ),
    );
  }
}

class HomeMiddleBanner extends StatelessWidget {
  const HomeMiddleBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.h,
      width: double.infinity,
      color: AppConstants.authPurple,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Center(
        child: Container(
          height: 140,
          decoration: BoxDecoration(
            color: AppConstants.authBackground,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Row(
            children: [
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Weekly\nChallenge",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.limeAccent,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Plank With Hip Twist",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                  topLeft: Radius.circular(
                    20,
                  ),
                  bottomLeft: Radius.circular(20),
                ),
                child: Image.asset(
                  "assets/images/ic_training_1.png",
                  width: 140,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ExerciseSection extends StatelessWidget {
  const ExerciseSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          ExerciseCard(
            assetPath: 'assets/images/ic_training_1.png',
            onPlay: null,
            onStar: null,
            cardTitle: "Full Body Workout",
          ),
          ExerciseCard(
            assetPath: 'assets/images/ic_training_2.png',
            onPlay: null,
            onStar: null,
            cardTitle: "Cardio Training",
          ),
        ],
      ),
    );
  }
}

class ExerciseCard extends StatelessWidget {
  const ExerciseCard({
    required this.cardTitle,
    required this.assetPath,
    required this.onPlay,
    required this.onStar,
    super.key,
  });
  final VoidCallback? onPlay;
  final VoidCallback? onStar;
  final String assetPath;
  final String cardTitle;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 4,
        ),
        decoration: BoxDecoration(
          color: AppConstants.authBackground,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.white.withOpacity(0.8),
            width: 1.5,
          ),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(14.5),
                  ),
                  child: Image.asset(
                    assetPath,
                    height: 100,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 12, 8, 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cardTitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: AppConstants.authAccent,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Row(
                        children: [
                          Icon(
                            Icons.access_time_filled,
                            color: AppConstants.authPurple,
                            size: 14,
                          ),
                          SizedBox(width: 4),
                          Text(
                            "12 Min",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.whatshot,
                            color: AppConstants.authPurple,
                            size: 14,
                          ),
                          SizedBox(width: 4),
                          Text(
                            "120 Kcal",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 6,
              right: 6,
              child: InkWell(
                onTap: onPlay,
                child: const Icon(
                  Icons.star,
                  color: AppConstants.authAccent,
                  size: 20,
                ),
              ),
            ),
            Positioned(
              right: 8,
              top: 85,
              child: InkWell(
                onTap: onStar,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    color: AppConstants.authPurple,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ContentTitle extends StatelessWidget {
  const _ContentTitle();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 24.w,
        right: 24.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Recommendation",
            style: TextStyle(
              color: AppConstants.authAccent,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              const Text(
                "See All",
                style: TextStyle(
                  color: AppConstants.cWhite,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 8.w),
              const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: AppConstants.authAccent,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CategorySection extends StatefulWidget {
  const CategorySection({super.key});

  @override
  State<CategorySection> createState() => _CategorySectionState();
}

class _CategorySectionState extends State<CategorySection> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> categories = [
    {"text": "Workout", "icon": Icons.fitness_center},
    {"text": "Progress\nTracking", "icon": Icons.track_changes},
    {"text": "Nutrition", "icon": Icons.apple},
    {"text": "Community", "icon": Icons.group},
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h),
      child: SizedBox(
        height: 80.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            return Row(
              children: [
                CategoryFields(
                  text: category["text"] as String,
                  icon: category["icon"] as IconData,
                  isSelected: _selectedIndex == index,
                  onTap: () {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                ),
                if (index != categories.length - 1)
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
  }
}

class HomeCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeCustomAppBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 20,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 12),
          Text(
            AppConstants.homeWelcome,
            style: context.theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppConstants.authPurple,
            ),
          ),
          Text(
            AppConstants.appBarDescription,
            style: context.theme.textTheme.bodySmall?.copyWith(
              color: AppConstants.cWhite,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search, color: AppConstants.authPurple),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications,
            color: AppConstants.authPurple,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.person, color: AppConstants.authPurple),
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}

class CategoryFields extends StatelessWidget {
  const CategoryFields({
    required this.text,
    required this.icon,
    required this.isSelected,
    required this.onTap,
    super.key,
  });
  final String text;
  final bool isSelected;
  final IconData icon;
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
              icon,
              size: 36.sp,
              color: isSelected
                  ? AppConstants.authAccent
                  : AppConstants.authPurple,
            ),
            SizedBox(height: 8.h),
            Text(
              text,
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
