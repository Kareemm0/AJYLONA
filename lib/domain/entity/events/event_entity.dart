import 'package:ageal/domain/entity/events/branch_entity.dart';
import 'package:equatable/equatable.dart';

class EventEntity with EquatableMixin {
  int? id;
  String? arTitle;
  String? enTitle;
  String? image;
  String? location;
  String? date;
  String? day;
  String? price;
  String? tickets;
  String? festivalId;
  String? isActive;
  String? createdAt;
  String? updatedAt;
  Festival? festival;
  List<BranchEntity>? branches;

  EventEntity({
    this.id,
    this.arTitle,
    this.enTitle,
    this.image,
    this.location,
    this.date,
    this.day,
    this.price,
    this.tickets,
    this.festivalId,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.festival,
    this.branches,
  });

  @override
  List<Object?> get props => [
        id,
        arTitle,
        enTitle,
        image,
        location,
        date,
        day,
        price,
        tickets,
        festivalId,
        isActive,
        createdAt,
        updatedAt,
        festival,
        branches
      ];

  factory EventEntity.fromJson(Map<String, dynamic> json) {
    return EventEntity(
      id: json['id'] as int?,
      arTitle: json['ar_title'] as String?,
      enTitle: json['en_title'] as String?,
      image: json['image'] as String?,
      location: json['location'] as String?,
      date: json['date'] as String?,
      day: json['day'] as String?,
      price: json['price'] as String?,
      tickets: json['tickets'] as String?,
      festivalId: json['festival_id'] as String?,
      isActive: json['is_active'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      festival: json['festival'] == null
          ? null
          : Festival.fromJson(json['festival'] as Map<String, dynamic>),
      branches: (json['branches'] as List<dynamic>?)
          ?.map((e) => BranchEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class Festival with EquatableMixin {
  int? id;
  String? media;
  String? arTitle;
  String? enTitle;
  String? location;
  String? isActive;
  String? startDate;
  String? createdAt;
  String? updatedAt;

  Festival({
    this.id,
    this.media,
    this.arTitle,
    this.enTitle,
    this.location,
    this.isActive,
    this.startDate,
    this.createdAt,
    this.updatedAt,
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
        updatedAt
      ];

  factory Festival.fromJson(Map<String, dynamic> json) {
    return Festival(
      id: json['id'] as int?,
      media: json['media'] as String?,
      arTitle: json['ar_title'] as String?,
      enTitle: json['en_title'] as String?,
      location: json['location'] as String?,
      isActive: json['is_active'] as String?,
      startDate: json['start_date'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );
  }
}
