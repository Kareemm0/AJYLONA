import 'package:ageal/domain/entity/platfrom/playlists_and_episodes.dart';
import 'package:equatable/equatable.dart';

sealed class PlayListState extends Equatable {
  const PlayListState();
  @override
  List<Object?> get props => [];
}

final class PlayListInitialState extends PlayListState {}

final class PlayListLoadingState extends PlayListState {}

final class PlayListSuccessState extends PlayListState {
  final PlaylistsAndEpisodes playlistsAndEpisodes;
  @override
  List<Object?> get props => [playlistsAndEpisodes];

  const PlayListSuccessState(this.playlistsAndEpisodes);
}

final class PlayListFailureState extends PlayListState {
  final String errorMessage;
  @override
  List<Object?> get props => [errorMessage];

  const PlayListFailureState(this.errorMessage);
}
