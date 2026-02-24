import 'package:equatable/equatable.dart';

class Article extends Equatable {
  const Article({
    required this.id,
    required this.title,
    required this.imagePath,
    this.isFavorite = false,
  });

  final String id;
  final String title;
  final String imagePath;
  final bool isFavorite;

  Article copyWith({
    String? id,
    String? title,
    String? imagePath,
    bool? isFavorite,
  }) {
    return Article(
      id: id ?? this.id,
      title: title ?? this.title,
      imagePath: imagePath ?? this.imagePath,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  List<Object?> get props => [id, title, imagePath, isFavorite];
}
