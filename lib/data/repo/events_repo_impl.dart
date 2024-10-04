import 'package:ageal/core/network/error/failure.dart';
import 'package:ageal/data/source/source_base/events_source.dart';
import 'package:ageal/domain/entity/events/branch_entity.dart';
import 'package:ageal/domain/entity/events/event_entity.dart';
import 'package:ageal/domain/entity/events/festival_entity.dart';
import 'package:ageal/domain/repo/events_repo.dart';
import 'package:dartz/dartz.dart';

class EventsRepoImpl implements EventsRepo {
  EventsSource eventsSource;
  EventsRepoImpl({required this.eventsSource});
  @override
  Future<Either<Failure, FestivalEntity>> getEvents() async {
    try {
      final response = await eventsSource.getEvents();
      if (!(response['status'] as bool)) {
        return Left(ServerFailure(response['message'] as String));
      }
      return Right(FestivalEntity.fromJson(
          response['data']['festival'] as Map<String, dynamic>));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, EventEntity>> getEventsById({required int id}) async {
    try {
      final response = await eventsSource.getEventsById(id: id);
      if (!(response['status'] as bool)) {
        return Left(ServerFailure(response['message'] as String));
      }
      return Right(EventEntity.fromJson(
          response['data']['event'] as Map<String, dynamic>));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> reserve({required int eventId}) async {
    try {
      final response = await eventsSource.reserve(eventId: eventId);
      if (!(response['status'] as bool)) {
        return Left(ServerFailure(response['message'] as String));
      }
      return Right(response['message']);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, BranchEntity>> getTicketsDataById(
      {required int ticketId}) async {
    try {
      final response =
          await eventsSource.getTicketsDataById(ticketId: ticketId);
      if (!(response['status'] as bool)) {
        return Left(ServerFailure(response['message'] as String));
      }
      return Right(BranchEntity.fromJson(
          response['data']['branch'] as Map<String, dynamic>));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
