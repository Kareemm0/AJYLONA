import 'package:ageal/core/network/error/failure.dart';
import 'package:ageal/data/source/source_base/profile/user_data_source.dart';
import 'package:ageal/domain/entity/auth/user.dart';
import 'package:ageal/domain/repo/profile/user_data_repo.dart';
import 'package:dartz/dartz.dart';

class UserDataRepoImpl implements UserDataRepo {
  UserDataSource settingSource;
  UserDataRepoImpl({required this.settingSource});

  @override
  Future<Either<Failure, UserDataEntity>> getUserData() async {
    try {
      final response = await settingSource.getUserData();
      if (!(response['status'] as bool)) {
        return Left(ServerFailure(response['message'] as String));
      }
      return Right(
          UserDataEntity.fromJson(response['data'] as Map<String, dynamic>));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> updateUserData(
      {String? name,
      String? phoneNumber,
      String? email,
      String? pic,
      String? date,
      String? gender}) async {
    try {
      final response = await settingSource.updateUserData(
          name: name,
          phoneNumber: phoneNumber,
          email: email,
          pic: pic,
          date: date,
          gender: gender);
      if (!(response['status'] as bool)) {
        return Left(ServerFailure(
            response['errors'].toString().contains('phone')
                ? response['errors']['phone'][0]
                : response['message'] as String));
      }
      return Right(response['message'] as String);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> deleteProfile() async {
    try {
      final response = await settingSource.deleteProfile();

      return Right(response['message'] as String);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
