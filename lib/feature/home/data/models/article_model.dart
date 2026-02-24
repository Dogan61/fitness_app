import 'package:fitness_app/feature/home/domain/entities/article.dart';

class ArticleModel extends Article {
  const ArticleModel({
    required super.id,
    required super.title,
    required super.imagePath,
    super.isFavorite,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      id: json['id'] as String,
      title: json['title'] as String,
      imagePath: json['image_path'] as String,
      isFavorite: json['is_favorite'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'image_path': imagePath,
      'is_favorite': isFavorite,
    };
  }

  static List<ArticleModel> get mockData => [
        const ArticleModel(
          id: '1',
          title: 'Supplement Guide',
          imagePath: 'assets/images/ic_articles_1.png',
          isFavorite: true,
        ),
        const ArticleModel(
          id: '2',
          title: '15 Quick & Effective Daily Routines',
          imagePath: 'assets/images/ic_articles_1.png',
        ),
      ];
}
