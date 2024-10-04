abstract class LoginSource {
  Future<Map<String, dynamic>> login({
    required String phone,
    required String password,
  });
}
