import 'package:equatable/equatable.dart';

import 'category.dart';

class News with EquatableMixin {
  final int id;
  final String arHead;
  final String arTitle;
  final String arContent;
  final String enHead;
  final String enTitle;
  final String enContent;
  final String image;
  final String newsCategoryId;
  final String isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Category newsCategory;

  const News({
    required this.id,
    required this.arHead,
    required this.arTitle,
    required this.arContent,
    required this.enHead,
    required this.enTitle,
    required this.enContent,
    required this.image,
    required this.newsCategoryId,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.newsCategory,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      id: json['id'],
      arHead: json['ar_head'],
      arTitle: json['ar_title'],
      arContent: json['ar_content'],
      enHead: json['en_head'],
      enTitle: json['en_title'],
      enContent: json['en_content'],
      image: json['image'],
      newsCategoryId: json['news_category_id'],
      isActive: json['is_active'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      newsCategory: Category.fromJson(json['news_category']),
    );
  }

  @override
  List<Object?> get props => [
        id,
        arHead,
        arTitle,
        arContent,
        enHead,
        enTitle,
        enContent,
        image,
        newsCategoryId,
        isActive,
        createdAt,
        updatedAt,
        newsCategory,
      ];
}
