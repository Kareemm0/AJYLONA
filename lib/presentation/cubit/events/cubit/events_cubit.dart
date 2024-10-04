
import 'package:ageal/domain/entity/events/branch_entity.dart';
import 'package:ageal/domain/entity/events/event_entity.dart';
import 'package:ageal/domain/entity/events/festival_entity.dart';
import 'package:ageal/domain/repo/events_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'events_state.dart';

class EventsCubit extends Cubit<EventsState> {
  final EventsRepo eventsRepo;
  EventsCubit({required this.eventsRepo}) : super(EventsInitial());

  Future<void> getEvents() async {
    emit(EventsLoading());
    final response = await eventsRepo.getEvents();
    response.fold((failure) {
      emit(EventsFailure(message: failure.message));
    }, (eventsResult) {
      emit(EventsSuccess(festivalEntity: eventsResult));
    });
  }

  Future<void> getEventsById({required int id}) async {
    final FestivalEntity festivalEntity =
        (state as EventsSuccess).festivalEntity;
    emit(EventsByIdLoading(festivalEntity: festivalEntity));
    final response = await eventsRepo.getEventsById(id: id);
    response.fold((failure) {
      emit(EventsByIdFailure(
          message: failure.message, festivalEntity: festivalEntity));
    }, (eventsResult) {
      emit(EventsByIdSuccess(
          festivalEntity: festivalEntity, eventEntity: eventsResult));
    });
  }

  Future<void> reserve({required int eventId}) async {
    final FestivalEntity festivalEntity =
        (state as EventsSuccess).festivalEntity;
    final EventEntity eventEntity = (state as EventsByIdSuccess).eventEntity;
    emit(EventsReserveLoading(
        festivalEntity: festivalEntity, eventEntity: eventEntity));
    final response = await eventsRepo.reserve(eventId: eventId);
    response.fold((failure) {
      emit(EventsReserveFailure(
          message: failure.message,
          festivalEntity: festivalEntity,
          eventEntity: eventEntity));
    }, (success) {
      emit(EventsReserveSuccess(
          success: success,
          festivalEntity: festivalEntity,
          eventEntity: eventEntity));
    });
  }

  Future<void> getTicketsDataById({required int ticketId}) async {
    final FestivalEntity festivalEntity =
        (state as EventsSuccess).festivalEntity;
    final EventEntity eventEntity = (state as EventsByIdSuccess).eventEntity;
    //final String success = (state as EventsReserveSuccess).success;
    emit(EventsTicketsDataLoading(
        //  success: success,
        festivalEntity: festivalEntity,
        eventEntity: eventEntity));
    final response = await eventsRepo.getTicketsDataById(ticketId: ticketId);
    response.fold((failure) {
      emit(EventsTicketsDataFailure(
          message: failure.message,
          //  success: success,
          festivalEntity: festivalEntity,
          eventEntity: eventEntity));
    }, (ticketsData) {
      emit(EventsTicketsDataSuccess(
          branchEntity: ticketsData,
          //  success: success,
          festivalEntity: festivalEntity,
          eventEntity: eventEntity));
    });
  }
}
