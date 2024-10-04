import 'package:ageal/domain/entity/platfrom/episodes_list_entity.dart';
import 'package:equatable/equatable.dart';

import 'playlist_list.dart';

class PlaylistsAndEpisodes with EquatableMixin {
  List<PlaylistList> playlists;
  List<EpisodesListEntity> episodes;

  PlaylistsAndEpisodes({
    required this.playlists,
    required this.episodes,
  });

  @override
  List<Object?> get props => [playlists, episodes];

  factory PlaylistsAndEpisodes.fromJson(Map<String, dynamic> json) {
    return PlaylistsAndEpisodes(
      playlists: (json['playlists'] as List<dynamic>)
          .map((e) => PlaylistList.fromJson(e as Map<String, dynamic>))
          .toList(),
      episodes: (json['episodes'] as List<dynamic>)
          .map((e) => EpisodesListEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
