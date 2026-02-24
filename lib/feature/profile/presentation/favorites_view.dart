import 'package:fitness_app/core/constants/app_constants.dart';
import 'package:fitness_app/core/extension/dart_extension.dart';
import 'package:fitness_app/core/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({super.key});

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const FavoritesAppBar(),
      body: Column(
        children: [
          _buildFilterSection(),

          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              itemCount: 4, 
              itemBuilder: (context, index) {
                return FavoritesCard(
                  isFavorite: index == 0,
                  onFavoriteToggle: () {
                    setState(() {});
                  },
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }

  Widget _buildFilterSection() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            "Sort By",
            style: TextStyle(color: AppConstants.authAccent),
          ),
          _FilterButton(label: "All", width: 75.w),
          _FilterButton(label: "Video", width: 75.w),
          _FilterButton(label: "Article", width: 75.w),
        ],
      ),
    );
  }
}

class FavoritesCard extends StatelessWidget {
  const FavoritesCard({
    required this.isFavorite,
    required this.onFavoriteToggle,
    super.key,
  });
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
      height: 120.h,
      decoration: BoxDecoration(
        color: AppConstants.cWhite,
        borderRadius: BorderRadius.circular(24.r),
          boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.all(16.r),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Upper Body",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: AppConstants.cBlack,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        "Daily routine can boost your health...",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: AppConstants.cBlack,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(16.r),
                    left: Radius.circular(24.r),
                  ),
                  child: Image.asset(
                    "assets/images/ic_training_1.png",
                    fit: BoxFit.cover,
                    height: double.infinity,
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 5.h,
            right: 5.w,
            child: IconButton(
              onPressed: onFavoriteToggle,
              icon: Icon(
                isFavorite ? Icons.star : Icons.star_border,
                color: isFavorite ? AppConstants.authAccent : Colors.grey,
                size: 24.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FilterButton extends StatelessWidget {
  const _FilterButton({
    required this.label,
    required this.width,
  });
  final String label;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 20.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppConstants.authAccent,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: AppConstants.cBlack,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class FavoritesAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FavoritesAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leadingWidth: 20,
      leading: IconButton(
        onPressed: () => Navigator.of(context).maybePop(),
        icon: Icon(
          Icons.arrow_back_ios_new_outlined,
          color: AppConstants.authAccent,
          size: 15.sp,
        ),
      ),
      centerTitle: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Favorites",
            style: context.theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppConstants.authPurple,
              fontSize: 22.sp,
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

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
