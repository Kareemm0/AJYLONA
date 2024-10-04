import 'package:ageal/domain/entity/auth/user_entity.dart';
import 'package:dartz/dartz.dart';
import '../../../core/network/error/failure.dart';

abstract class LoginRepo {
  Future<Either<Failure, UserEntity>> login({
    required String phone,
    required String password,
  });
}
