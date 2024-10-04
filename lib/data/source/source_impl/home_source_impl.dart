import 'package:ageal/core/constants/end_point.dart';
import 'package:ageal/core/network/dio/base_dio.dart';
import 'package:ageal/data/source/source_base/home_source.dart';

class HomeSourceImpl implements HomeSource {
  final BaseDio baseDio;

  const HomeSourceImpl({required this.baseDio});
  @override
  Future<Map<String, dynamic>> getHome() async {
    try {
      final response = await baseDio.get(EndPoint.home);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
