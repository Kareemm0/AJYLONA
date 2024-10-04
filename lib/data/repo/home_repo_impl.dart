import 'package:ageal/core/network/error/failure.dart';
import 'package:ageal/data/source/source_base/home_source.dart';
import 'package:ageal/domain/entity/home_entity.dart';
import 'package:ageal/domain/repo/home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeSource homeSource;

  HomeRepoImpl({required this.homeSource});
  @override
  Future<Either<Failure, HomeEntity>> getHome() async {
    try {
      final response = await homeSource.getHome();
      if (!(response['status'] as bool)) {
        return Left(ServerFailure(response['message'] as String));
      }
      return Right(
          HomeEntity.fromJson(response['data'] as Map<String, dynamic>));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
