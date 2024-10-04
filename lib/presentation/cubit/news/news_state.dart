import 'package:ageal/domain/entity/news/news_entitiy.dart';
import 'package:equatable/equatable.dart';

sealed class NewsState extends Equatable {
  const NewsState();
  @override
  List<Object?> get props => [];
}

final class NewInitialState extends NewsState {}

final class NewLoadingState extends NewsState {}

final class NewSuccessState extends NewsState {
  final NewsEntities newsEntities;
  @override
  List<Object> get props => [newsEntities];

  const NewSuccessState({required this.newsEntities});
}

final class NewFailureState extends NewsState {
  final String errorMessage;
  @override
  List<Object> get props => [errorMessage];

  const NewFailureState({required this.errorMessage});
}
