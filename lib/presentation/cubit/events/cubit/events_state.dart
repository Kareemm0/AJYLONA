part of 'events_cubit.dart';

sealed class EventsState extends Equatable {
  const EventsState();

  @override
  List<Object> get props => [];
}

final class EventsInitial extends EventsState {}

final class EventsLoading extends EventsState {}

final class EventsFailure extends EventsState {
  final String message;
  const EventsFailure({required this.message});

  @override
  List<Object> get props => [message];
}

final class EventsSuccess extends EventsState {
  final FestivalEntity festivalEntity;
  const EventsSuccess({required this.festivalEntity});

  @override
  List<Object> get props => [festivalEntity];
}

final class EventsByIdSuccess extends EventsSuccess {
  final EventEntity eventEntity;
  const EventsByIdSuccess({
    required super.festivalEntity,
    required this.eventEntity,
  });

  @override
  List<Object> get props => [eventEntity, ...super.props];
}

final class EventsByIdLoading extends EventsSuccess {
  const EventsByIdLoading({required super.festivalEntity});
}

final class EventsByIdFailure extends EventsSuccess {
  final String message;
  const EventsByIdFailure({
    required super.festivalEntity,
    required this.message,
  });

  @override
  List<Object> get props => [message, ...super.props];
}

final class EventsReserveSuccess extends EventsByIdSuccess {
  final String success;
  const EventsReserveSuccess({
    required this.success,
    required super.festivalEntity,
    required super.eventEntity,
  });
  @override
  List<Object> get props => [success, ...super.props];
}

final class EventsReserveFailure extends EventsByIdSuccess {
  final String message;
  const EventsReserveFailure({
    required this.message,
    required super.festivalEntity,
    required super.eventEntity,
  });
  @override
  List<Object> get props => [message, ...super.props];
}

final class EventsReserveLoading extends EventsByIdSuccess {
  const EventsReserveLoading({
    required super.festivalEntity,
    required super.eventEntity,
  });
}

final class EventsTicketsDataSuccess extends EventsByIdSuccess {
  final BranchEntity branchEntity;
  const EventsTicketsDataSuccess({
    required this.branchEntity,
   // required super.success,
    required super.festivalEntity,
    required super.eventEntity,
  });
  @override
  List<Object> get props => [branchEntity, ...super.props];
}

final class EventsTicketsDataFailure extends EventsByIdSuccess {
  final String message;
  const EventsTicketsDataFailure({
    required this.message,
    //required super.success,
    required super.festivalEntity,
    required super.eventEntity,
  });
  @override
  List<Object> get props => [message, ...super.props];
}

final class EventsTicketsDataLoading extends EventsByIdSuccess {
  const EventsTicketsDataLoading({
   // required super.success,
    required super.festivalEntity,
    required super.eventEntity,
  });
}
