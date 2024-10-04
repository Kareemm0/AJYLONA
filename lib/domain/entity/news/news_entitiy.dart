import 'package:ageal/domain/entity/news/category.dart';
import 'package:equatable/equatable.dart';

import 'news.dart';

class NewsEntities with EquatableMixin {
  List<NewsModel>? news;
  List<Categories>? categories;

  NewsEntities({
    this.news,
    this.categories,
  });

  @override
  List<Object?> get props => [news, categories];

  factory NewsEntities.fromJson(Map<String, dynamic> json) {
    return NewsEntities(
      news: (json['news'] as List<dynamic>?)
          ?.map((e) => NewsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => Categories.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
