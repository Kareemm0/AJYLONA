import 'package:ageal/data/source/source_base/news/news_source.dart';
import '../../../../core/constants/end_point.dart';
import '../../../../core/network/dio/base_dio.dart';

class NewsSourceImpl implements NewsSource {
  final BaseDio baseDio;

  NewsSourceImpl(this.baseDio);
  @override
  Future<Map<String, dynamic>> getNews() async {
    try {
      final response = await baseDio.get(EndPoint.news);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
