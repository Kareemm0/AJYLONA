
import 'package:ageal/core/network/error/failure.dart';
import 'package:ageal/domain/entity/auth/user.dart';
import 'package:dartz/dartz.dart';

abstract class UserDataRepo {
  Future<Either<Failure, UserDataEntity>> getUserData();
  Future<Either<Failure, String>> updateUserData({
    String? name,
    String? phoneNumber,
    String? email,
    String? pic,
    String? date,
    String? gender,
  });

  Future<Either<Failure, String>> deleteProfile();
}
