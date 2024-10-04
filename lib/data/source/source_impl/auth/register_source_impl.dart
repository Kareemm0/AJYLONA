import '../../../../core/constants/end_point.dart';
import '../../../../core/network/dio/base_dio.dart';
import '../../source_base/auth/register_source.dart';

class RegisterSourceImpl implements RegisterSource {
  final BaseDio baseDio;

  const RegisterSourceImpl({required this.baseDio});

  @override
  Future<Map<String, dynamic>> register({
    required String name,
    required String phone,
    required String password,
    required String email,
    required String geneder,
  }) async {
    try {
      final response = await baseDio.post(
        EndPoint.register,
        data: {
          'name': name,
          'phone': phone,
          'password': password,
          'email': email,
          'gender': geneder,
        },
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
