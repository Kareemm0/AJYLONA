import 'package:equatable/equatable.dart';

class NewsModel with EquatableMixin {
  int? id;
  String? arHead;
  String? arTitle;
  String? arContent;
  String? enHead;
  String? enTitle;
  String? enContent;
  String? image;
  String? newsCategoryId;
  String? isActive;
  String? createdAt;
  String? updatedAt;
  NewsCategory? newsCategory;

  NewsModel({
    this.id,
    this.arHead,
    this.arTitle,
    this.arContent,
    this.enHead,
    this.enTitle,
    this.enContent,
    this.image,
    this.newsCategoryId,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.newsCategory,
  });

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
        newsCategory
      ];

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      id: json['id'] as int?,
      arHead: json['ar_head'] as String?,
      arTitle: json['ar_title'] as String?,
      arContent: json['ar_content'] as String?,
      enHead: json['en_head'] as String?,
      enTitle: json['en_title'] as String?,
      enContent: json['en_content'] as String?,
      image: json['image'] as String?,
      newsCategoryId: json['news_category_id'] as String?,
      isActive: json['is_active'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      newsCategory: json['news_category'] == null
          ? null
          : NewsCategory.fromJson(
              json['news_category'] as Map<String, dynamic>),
    );
  }
}

class NewsCategory with EquatableMixin {
  int? id;
  String? arName;
  String? enName;
  String? isActive;
  String? createdAt;
  String? updatedAt;

  NewsCategory({
    this.id,
    this.arName,
    this.enName,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props =>
      [id, arName, enName, isActive, createdAt, updatedAt];

  factory NewsCategory.fromJson(Map<String, dynamic> json) {
    return NewsCategory(
      id: json['id'] as int?,
      arName: json['ar_name'] as String?,
      enName: json['en_name'] as String?,
      isActive: json['is_active'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );
  }
}
