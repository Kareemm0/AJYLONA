import 'package:ageal/core/network/error/failure.dart';
import 'package:ageal/domain/entity/auth/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class RegisterRepo {
  Future<Either<Failure, UserEntity>> register({
    required String name,
    required String phone,
    required String password,
    required String email,
    required String geneder,
  });
}
