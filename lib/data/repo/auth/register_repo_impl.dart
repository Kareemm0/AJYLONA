import 'package:ageal/core/network/error/failure.dart';
import 'package:ageal/domain/entity/auth/user_entity.dart';
import 'package:dartz/dartz.dart';
import '../../../domain/repo/auth/register_repo.dart';
import '../../source/source_base/auth/register_source.dart';

class RegisterRepoImpl implements RegisterRepo {
  final RegisterSource registerSource;

  RegisterRepoImpl(this.registerSource);

  @override
  Future<Either<Failure, UserEntity>> register({
    required String name,
    required String phone,
    required String password,
    required String email,
    required String geneder,
  }) async {
    try {
      final response = await registerSource.register(
        name: name,
        phone: phone,
        password: password,
        email: email,
        geneder: geneder,
      );
      if (!(response['status'] as bool)) {
        return Left(ServerFailure(response['message'] as String));
      }
      return Right(
          UserEntity.fromJson(response['data'] as Map<String, dynamic>));
    } catch (e) {
      return Left(
        ServerFailure(e.toString()),
      );
    }
  }
}
