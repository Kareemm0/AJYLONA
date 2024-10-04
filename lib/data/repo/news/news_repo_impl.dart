import 'package:ageal/core/network/error/failure.dart';
import 'package:ageal/data/source/source_base/news/news_source.dart';
import 'package:ageal/domain/entity/news/news_entitiy.dart';
import 'package:ageal/domain/repo/news/news_repo.dart';
import 'package:dartz/dartz.dart';

class NewsRepoImpl implements NewsRepo {
  NewsSource newsSource;

  NewsRepoImpl(this.newsSource);
  @override
  Future<Either<Failure, NewsEntities>> getNews() async {
    try {
      final response = await newsSource.getNews();
      if (!(response['status'] as bool)) {
        return Left(ServerFailure(response['message'] as String));
      }
      return Right(
        NewsEntities.fromJson(response['data']),
      );
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
