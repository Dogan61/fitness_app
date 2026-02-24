import 'package:fitness_app/core/widgets/section_title_widget.dart';
import 'package:fitness_app/feature/home/domain/entities/article.dart';
import 'package:fitness_app/feature/home/presentation/widgets/article_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeArticlesSection extends StatelessWidget {
  const HomeArticlesSection({
    required this.articles,
    super.key,
  });

  final List<Article> articles;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(title: 'Articles & Tips'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: articles
                .take(2)
                .map(
                  (article) => ArticleCard(
                    imagePath: article.imagePath,
                    title: article.title,
                    isFavorite: article.isFavorite,
                    onTap: () {},
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
