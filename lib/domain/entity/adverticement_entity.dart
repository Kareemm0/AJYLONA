import 'package:equatable/equatable.dart';

class AdverticementEntity with EquatableMixin {
  int? id;
  String? arHead;
  String? arTitle;
  String? arContent;
  String? enHead;
  String? enTitle;
  String? enContent;
  String? image;
  String? isActive;
  String? createdAt;
  String? updatedAt;

  AdverticementEntity({
    this.id,
    this.arHead,
    this.arTitle,
    this.arContent,
    this.enHead,
    this.enTitle,
    this.enContent,
    this.image,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        arHead,
        arTitle,
        arContent,
        enHead,
        enTitle,
        enContent,
        image,
        isActive,
        createdAt,
        updatedAt
      ];

  factory AdverticementEntity.fromJson(Map<String, dynamic> json) {
    return AdverticementEntity(
      id: json['id'] as int?,
      arHead: json['ar_head'] as String?,
      arTitle: json['ar_title'] as String?,
      arContent: json['ar_content'] as String?,
      enHead: json['en_head'] as String?,
      enTitle: json['en_title'] as String?,
      enContent: json['en_content'] as String?,
      image: json['image'] as String?,
      isActive: json['is_active'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );
  }
}
