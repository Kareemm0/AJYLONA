import 'package:ageal/domain/repo/paltform/playlist_and_episodes_repo.dart';
import 'package:bloc/bloc.dart';

import 'play_list_state.dart';

class PlayListCubit extends Cubit<PlayListState> {
  final PlaylistAndEpisodesRepo plyList;
  PlayListCubit(this.plyList) : super(PlayListInitialState());

  Future<void> playList() async {
    emit(PlayListLoadingState());
    final result = await plyList.playListAndEpisodes();
    result.fold((failure) {
      emit(PlayListFailureState(failure.message));
    }, (episodes) {
      emit(PlayListSuccessState(episodes));
    });
  }
}
