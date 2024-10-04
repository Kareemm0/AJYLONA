abstract class RegisterSource {
  Future<Map<String, dynamic>> register({
    required String name,
    required String phone,
    required String password,
    required String email,
    required String geneder,
  });
}
