import 'package:ageal/core/constants/end_point.dart';
import 'package:ageal/core/network/dio/base_dio.dart';
import 'package:ageal/data/source/source_base/auth/login_source.dart';

class LoginSourceImpl implements LoginSource {
  final BaseDio dio;

  LoginSourceImpl({required this.dio});
  @override
  Future<Map<String, dynamic>> login({
    required String phone,
    required String password,
  }) async {
    try {
      final response = await dio.post(EndPoint.login, data: {
        'email_or_phone': phone,
        'password': password,
      });
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
