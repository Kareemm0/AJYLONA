abstract class UserDataSource {
  Future<Map<String, dynamic>> getUserData();
  Future<Map<String, dynamic>> updateUserData({
    String? name,
    String? phoneNumber,
    String? email,
    String? pic,
    String? date,
    String? gender,
  });

  Future<Map<String, dynamic>> deleteProfile();
}
