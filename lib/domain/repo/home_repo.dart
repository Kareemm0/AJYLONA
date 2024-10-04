import 'package:ageal/core/network/error/failure.dart';
import 'package:ageal/domain/entity/home_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, HomeEntity>> getHome();
}
