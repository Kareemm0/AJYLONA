import 'package:equatable/equatable.dart';

import 'event_entity.dart';

class FestivalEntity with EquatableMixin {
  int? id;
  String? media;
  String? arTitle;
  String? enTitle;
  String? location;
  String? isActive;
  String? startDate;
  String? createdAt;
  String? updatedAt;
  List<EventEntity>? events;

  FestivalEntity({
    this.id,
    this.media,
    this.arTitle,
    this.enTitle,
    this.location,
    this.isActive,
    this.startDate,
    this.createdAt,
    this.updatedAt,
    this.events,
  });

  @override
  List<Object?> get props => [
        id,
        media,
        arTitle,
        enTitle,
        location,
        isActive,
        startDate,
        createdAt,
        updatedAt,
        events
      ];

  factory FestivalEntity.fromJson(Map<String, dynamic> json) {
    return FestivalEntity(
      id: json['id'] as int?,
      media: json['media'] as String?,
      arTitle: json['ar_title'] as String?,
      enTitle: json['en_title'] as String?,
      location: json['location'] as String?,
      isActive: json['is_active'] as String?,
      startDate: json['start_date'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      events: (json['events'] as List<dynamic>?)
          ?.map((e) => EventEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
