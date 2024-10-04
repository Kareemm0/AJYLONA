import 'package:equatable/equatable.dart';

class Category with EquatableMixin {
  final int id;
  final String arName;
  final String enName;
  final String isActive;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Category({
    required this.id,
    required this.arName,
    required this.enName,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      arName: json['ar_name'],
      enName: json['en_name'],
      isActive: json['is_active'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  @override
  List<Object?> get props =>
      [id, arName, enName, isActive, createdAt, updatedAt];
}
