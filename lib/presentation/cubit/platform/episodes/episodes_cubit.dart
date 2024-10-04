import 'package:ageal/domain/repo/paltform/episodes_repo.dart';
import 'package:ageal/presentation/cubit/platform/episodes/episodes_state.dart';
import 'package:bloc/bloc.dart';

class EpisodesCubit extends Cubit<EpisodesState> {
  final EpisodesRepo episodesRepo;
  EpisodesCubit(this.episodesRepo) : super(EpisodesInitialState());

  Future<void> episodes() async {
    emit(EpisodeLoadingState());
    final result = await episodesRepo.episodes();
    result.fold((failure) {
      emit(EpisodesFailurState(failure.message));
    }, (episodes) {
      emit(EpisodesSuccessState(episodes));
    });
  }
}
