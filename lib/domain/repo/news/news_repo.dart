import 'package:ageal/core/network/error/failure.dart';
import 'package:dartz/dartz.dart';

import '../../entity/news/news_entitiy.dart';

abstract class NewsRepo {
  Future<Either<Failure, NewsEntities>> getNews();
}
