import 'package:ageal/core/network/error/failure.dart';
import 'package:ageal/data/source/source_base/platform/episodes_source.dart';
import 'package:ageal/domain/entity/platfrom/episodes_entity.dart';
import 'package:ageal/domain/repo/paltform/episodes_repo.dart';
import 'package:dartz/dartz.dart';

class EpisodesRepoImpl implements EpisodesRepo {
  final EpisodesSource episodesSource;

  EpisodesRepoImpl(this.episodesSource);
  @override
  Future<Either<Failure, EpisodesEntity>> episodes() async {
    try {
      final response = await episodesSource.episodes();
      if (!(response['status'] as bool)) {
        return Left(ServerFailure(response['message'] as String));
      }
      return Right(
        EpisodesEntity.fromJson(response['data']),
      );
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
