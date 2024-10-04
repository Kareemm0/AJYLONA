import 'package:ageal/core/network/error/failure.dart';
import 'package:ageal/data/source/source_base/platform/playlist_and_episodes_source.dart';
import 'package:ageal/domain/entity/platfrom/playlists_and_episodes.dart';
import 'package:dartz/dartz.dart';
import '../../../domain/repo/paltform/playlist_and_episodes_repo.dart';

class PlayListAndEpisodesRepoImpl implements PlaylistAndEpisodesRepo {
  final PlaylistAndEpisodesSource playlistAndEpisodesSource;

  PlayListAndEpisodesRepoImpl(this.playlistAndEpisodesSource);

  @override
  Future<Either<Failure, PlaylistsAndEpisodes>> playListAndEpisodes() async {
    try {
      final response = await playlistAndEpisodesSource.playListAndEpisodes();
      if (!(response['status'] as bool)) {
        return Left(ServerFailure(response['message'] as String));
      }
      return Right(
        PlaylistsAndEpisodes.fromJson(response['data']),
      );
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
