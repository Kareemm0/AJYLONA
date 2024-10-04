import 'package:ageal/domain/entity/platfrom/episodes_list_entity.dart';
import 'package:ageal/domain/entity/platfrom/playlist_list.dart';
import '../../../domain/entity/platfrom/playlists_and_episodes.dart';

List<dynamic> searchAllEntities(String query) {
  // print('searchAllEntities called with query: $query');
  List<dynamic> results = [];

  PlaylistsAndEpisodes playlistsAndEpisodes = PlaylistsAndEpisodes(
    episodes: [],
    playlists: [],
  );
  //HomeEntity? homeEntity;

  //! Search through the PlaylistsAndEpisodes entity
  List<PlaylistList>? playlists = playlistsAndEpisodes.playlists;
  List<EpisodesListEntity> episodes = playlistsAndEpisodes.episodes;
  results.addAll(playlists);
  results.addAll(episodes);

  // // //! Search through the EpisodesEntity entity
  // List<Episodes>? episodesEntity = EpisodesEntity().episodes;
  // results.addAll(episodesEntity!.where((episode) =>
  //     episode.arTitle!.toLowerCase().contains(query.toLowerCase())));

  // //! Search through the HomeEntity entity
  // List<NewsEntity>? motions = HomeEntity().news;
  // results.addAll(motions!.where(
  //     (motion) => motion.arTitle!.toLowerCase().contains(query.toLowerCase())));

  // //! Search through the EventEntity entity
  // List<EventEntity>? events;
  // results.addAll(events!.where(
  //     (event) => event.arTitle!.toLowerCase().contains(query.toLowerCase())));

  // //! Search through the BranchEntity entity
  // List<BranchEntity> branches = BranchEntity().branches;
  // results.addAll(branches.where(
  //     (branch) => branch.name.toLowerCase().contains(query.toLowerCase())));

  return results;
}
