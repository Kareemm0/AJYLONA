import 'package:ageal/core/constants/end_point.dart';
import 'package:ageal/core/network/dio/base_dio.dart';
import 'package:ageal/data/source/source_base/platform/episodes_source.dart';

class EpisodesSourceImpl implements EpisodesSource {
  final BaseDio dio;

  EpisodesSourceImpl(this.dio);
  @override
  Future<Map<String, dynamic>> episodes() async {
    try {
      final response = await dio.get(EndPoint.getEpisodesByPlaylistId);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
