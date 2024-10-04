import 'package:equatable/equatable.dart';

class NewsCategoryEntity with EquatableMixin {
  int? id;
  String? arName;
  String? enName;
  String? isActive;
  String? createdAt;
  String? updatedAt;

  NewsCategoryEntity({
    this.id,
    this.arName,
    this.enName,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props =>
      [id, arName, enName, isActive, createdAt, updatedAt];

  factory NewsCategoryEntity.fromJson(Map<String, dynamic> json) {
    return NewsCategoryEntity(
      id: json['id'] as int?,
      arName: json['ar_name'] as String?,
      enName: json['en_name'] as String?,
      isActive: json['is_active'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );
  }
}
