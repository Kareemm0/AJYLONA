import 'package:ageal/core/network/error/failure.dart';
import 'package:ageal/domain/entity/platfrom/playlists_and_episodes.dart';
import 'package:dartz/dartz.dart';

abstract class PlaylistAndEpisodesRepo {
  Future<Either<Failure, PlaylistsAndEpisodes>> playListAndEpisodes();
}
