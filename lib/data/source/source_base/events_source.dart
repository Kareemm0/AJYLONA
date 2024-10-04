abstract class EventsSource {
  Future<Map<String, dynamic>> getEvents();
  Future<Map<String, dynamic>> getEventsById({required int id});
  Future<Map<String, dynamic>> reserve({required int eventId});
  Future<Map<String, dynamic>> getTicketsDataById({required int ticketId});
}
