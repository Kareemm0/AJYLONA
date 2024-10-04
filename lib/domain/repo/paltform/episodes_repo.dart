import 'package:ageal/core/network/error/failure.dart';
import 'package:ageal/domain/entity/platfrom/episodes_entity.dart';
import 'package:dartz/dartz.dart';

abstract class EpisodesRepo {
  Future<Either<Failure, EpisodesEntity>> episodes();
}
