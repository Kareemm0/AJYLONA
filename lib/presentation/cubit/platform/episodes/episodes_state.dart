import 'package:ageal/domain/entity/platfrom/episodes_entity.dart';
import 'package:equatable/equatable.dart';

sealed class EpisodesState extends Equatable {
  const EpisodesState();
  @override
  List<Object?> get props => [];
}

final class EpisodesInitialState extends EpisodesState {}

final class EpisodeLoadingState extends EpisodesState {}

final class EpisodesSuccessState extends EpisodesState {
  final EpisodesEntity entity;
  @override
  List<Object?> get props => [entity];

  const EpisodesSuccessState(this.entity);
}

final class EpisodesFailurState extends EpisodesState {
  final String errorMessage;
  @override
  List<Object?> get props => [errorMessage];

  const EpisodesFailurState(this.errorMessage);
}
