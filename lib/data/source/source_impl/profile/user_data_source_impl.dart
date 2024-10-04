import 'package:ageal/core/constants/end_point.dart';
import 'package:ageal/core/network/dio/base_dio.dart';
import 'package:ageal/data/source/source_base/profile/user_data_source.dart';
import 'package:dio/dio.dart';

class UserDataSourceImpl implements UserDataSource {
  final BaseDio baseDio;
  UserDataSourceImpl({required this.baseDio});

  @override
  Future<Map<String, dynamic>> getUserData() async {
    try {
      final response = await baseDio.get(EndPoint.getUserData,
          options: Options(
            followRedirects: false,
          ));
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> updateUserData(
      {String? name,
      String? phoneNumber,
      String? email,
      String? pic,
      String? date,
      String? gender}) async {
    final FormData formData = FormData.fromMap({
      'name': name,
      'phone': phoneNumber,
      'email': email,
      'birthdate': date,
      'gender': gender,
      'picture': pic
    });
    try {
      final response = await baseDio.post(EndPoint.update, data: formData);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> deleteProfile() async {
    try {
      final response = await baseDio.delete(EndPoint.deleteUser);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
