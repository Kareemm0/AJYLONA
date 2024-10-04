import 'package:ageal/core/constants/end_point.dart';
import 'package:ageal/core/network/dio/base_dio.dart';
import 'package:ageal/data/source/source_base/events_source.dart';


class EventsSourceImpl implements EventsSource {
  final BaseDio baseDio;

  EventsSourceImpl({required this.baseDio});
  @override
  Future<Map<String, dynamic>> getEvents() async {
    try {
      final response = await baseDio.get(EndPoint.targetFestival);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> getEventsById({required int id}) async {
    try {
      final response = await baseDio.get('${EndPoint.targetFestivalById}/$id');
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> reserve({required int eventId}) async {
    try {
      final response = await baseDio.post(
        '${EndPoint.reserve}$eventId/reserve',
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> getTicketsDataById(
      {required int ticketId}) async {
    try {
      final response =
          await baseDio.get('${EndPoint.ticketDataById}/$ticketId');
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
