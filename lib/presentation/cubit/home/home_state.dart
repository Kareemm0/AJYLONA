part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSuccess extends HomeState {
  final HomeEntity homeEntity;
  const HomeSuccess({required this.homeEntity});
  @override
  List<Object> get props => [homeEntity];
}

final class HomeFailure extends HomeState {
  final String message;
  const HomeFailure({required this.message});
  @override
  List<Object> get props => [message];
}
