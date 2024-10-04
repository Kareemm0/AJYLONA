import 'package:equatable/equatable.dart';

import 'category.dart';
import 'news.dart';

class DataResponse with EquatableMixin {
  final List<News> news;
  final List<Category> categories;

  const DataResponse({
    required this.news,
    required this.categories,
  });

  factory DataResponse.fromJson(Map<String, dynamic> json) {
    return DataResponse(
      news: (json['news'] as List<dynamic>)
          .map((newsItem) => News.fromJson(newsItem))
          .toList(),
      categories: (json['categories'] as List<dynamic>)
          .map((categoryItem) => Category.fromJson(categoryItem))
          .toList(),
    );
  }

  @override
  List<Object?> get props => [news, categories];
}
