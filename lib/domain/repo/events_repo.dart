import 'package:ageal/core/network/error/failure.dart';
import 'package:ageal/domain/entity/events/branch_entity.dart';
import 'package:ageal/domain/entity/events/event_entity.dart';
import 'package:ageal/domain/entity/events/festival_entity.dart';
import 'package:dartz/dartz.dart';

abstract class EventsRepo {
  Future<Either<Failure, FestivalEntity>> getEvents();
  Future<Either<Failure, EventEntity>> getEventsById({required int id});
  Future<Either<Failure, String>> reserve({required int eventId});
  Future<Either<Failure, BranchEntity>> getTicketsDataById(
      {required int ticketId});
}
