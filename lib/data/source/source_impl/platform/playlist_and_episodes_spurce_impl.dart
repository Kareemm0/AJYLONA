import 'package:ageal/core/constants/end_point.dart';
import 'package:ageal/core/network/dio/base_dio.dart';
import 'package:ageal/data/source/source_base/platform/playlist_and_episodes_source.dart';

class PlaylistAndEpisodesSpurceImpl implements PlaylistAndEpisodesSource {
  final BaseDio dio;

  PlaylistAndEpisodesSpurceImpl(this.dio);
  @override
  Future<Map<String, dynamic>> playListAndEpisodes() async {
    try {
      final response = await dio.get(EndPoint.playListAndEpisodes);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
