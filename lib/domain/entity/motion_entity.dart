import 'package:equatable/equatable.dart';

class MotionEntity with EquatableMixin {
  int? id;
  String? arTitle;
  String? enTitle;
  String? image;
  String? isActive;
  String? createdAt;
  String? updatedAt;

  MotionEntity({
    this.id,
    this.arTitle,
    this.enTitle,
    this.image,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props =>
      [id, arTitle, enTitle, image, isActive, createdAt, updatedAt];

  factory MotionEntity.fromJson(Map<String, dynamic> json) {
    return MotionEntity(
      id: json['id'] as int?,
      arTitle: json['ar_title'] as String?,
      enTitle: json['en_title'] as String?,
      image: json['image'] as String?,
      isActive: json['is_active'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );
  }
}
