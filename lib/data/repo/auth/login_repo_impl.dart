import 'package:ageal/core/network/error/failure.dart';
import 'package:ageal/domain/entity/auth/user_entity.dart';
import 'package:dartz/dartz.dart';
import '../../../domain/repo/auth/login_repo.dart';
import '../../source/source_base/auth/login_source.dart';

class LoginRepoImpl implements LoginRepo {
  final LoginSource loginSource;

  LoginRepoImpl(this.loginSource);
  @override
  Future<Either<Failure, UserEntity>> login({
    required String phone,
    required String password,
  }) async {
    try {
      final response =
          await loginSource.login(phone: phone, password: password);
      if (!(response['status'] as bool)) {
        return Left(ServerFailure(response['message'] as String));
      }
      return Right(UserEntity.fromJson(response['data']));
    } catch (e) {
      //  print("====================================================$e");
      return Left(
        ServerFailure(e.toString()),
      );
    }
  }
}
