import 'package:ageal/domain/entity/news_entity.dart';
import 'package:equatable/equatable.dart';
import 'adverticement_entity.dart';
import 'motion_entity.dart';

class HomeEntity with EquatableMixin {
  AdverticementEntity? adverticement;
  MotionEntity? motion;
  List<NewsEntity>? news;

  HomeEntity({
    this.adverticement,
    this.motion,
    this.news,
  });

  @override
  List<Object?> get props => [adverticement, motion, news];

  factory HomeEntity.fromJson(Map<String, dynamic> json) {
    return HomeEntity(
      adverticement: json['adverticement'] == null
          ? null
          : AdverticementEntity.fromJson(
              json['adverticement'] as Map<String, dynamic>),
      motion: json['motion'] == null
          ? null
          : MotionEntity.fromJson(json['motion'] as Map<String, dynamic>),
      news: (json['news'] as List<dynamic>?)
          ?.map((e) => NewsEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
