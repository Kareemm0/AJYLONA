import 'package:equatable/equatable.dart';

class BranchEntity with EquatableMixin {
  int? id;
  String? arName;
  String? enName;
  String? image;
  String? isActive;
  String? eventId;
  String? createdAt;
  String? updatedAt;

  BranchEntity({
    this.id,
    this.arName,
    this.enName,
    this.image,
    this.isActive,
    this.eventId,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props =>
      [id, arName, enName, image, isActive, eventId, createdAt, updatedAt];

  factory BranchEntity.fromJson(Map<String, dynamic> json) {
    return BranchEntity(
      id: json['id'] as int?,
      arName: json['ar_name'] as String?,
      enName: json['en_name'] as String?,
      image: json['image'] as String?,
      isActive: json['is_active'] as String?,
      eventId: json['event_id'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );
  }
}
