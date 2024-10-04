import 'package:equatable/equatable.dart';

class UserDataEntity with EquatableMixin {
  int? id;
  String? createdAt;
  String? updatedAt;
  String? name;
  String? email;
  String? emailVerifiedAt;
  String? phone;
  String? phoneVerifiedAt;
  String? picture;
  String? category;
  String? isActive;
  String? parentId;
  String? groupId;
  String? birthdate;
  String? gender;
  String? avatar;
  List<String>? media;

  UserDataEntity({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.phone,
    this.phoneVerifiedAt,
    this.picture,
    this.category,
    this.isActive,
    this.parentId,
    this.groupId,
    this.birthdate,
    this.gender,
    this.avatar,
    this.media,
  });

  @override
  List<Object?> get props => [
        id,
        createdAt,
        updatedAt,
        name,
        email,
        emailVerifiedAt,
        phone,
        phoneVerifiedAt,
        picture,
        category,
        isActive,
        parentId,
        groupId,
        birthdate,
        gender,
        avatar,
        media
      ];

  factory UserDataEntity.fromJson(Map<String, dynamic> json) {
    return UserDataEntity(
      id: json['id'] as int?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      emailVerifiedAt: json['email_verified_at'] as String?,
      phone: json['phone'] as String?,
      phoneVerifiedAt: json['phone_verified_at'] as String?,
      picture: json['picture'] as String?,
      category: json['category'] as String?,
      isActive: json['is_active'] as String?,
      parentId: json['parent_id'] as String?,
      groupId: json['group_id'] as String?,
      birthdate: json['birthdate'] as String?,
      gender: json['gender'] as String?,
      avatar: json['avatar'] as String?,
      media:
          (json['media'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );
  }
  UserDataEntity copyWith({
    int? id,
    String? createdAt,
    String? updatedAt,
    String? name,
    String? email,
    String? emailVerifiedAt,
    String? phone,
    String? phoneVerifiedAt,
    String? picture,  
    String? category,
    String? isActive,
    String? parentId,
    String? groupId,
    String? birthdate,
    String? gender,
    String? avatar,
    List<String>? media,
  }) {
    return UserDataEntity(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      name: name ?? this.name,
      email: email ?? this.email,
      emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
      phone: phone ?? this.phone,
      phoneVerifiedAt: phoneVerifiedAt ?? this.phoneVerifiedAt,
      picture: picture ?? this.picture,
      category: category ?? this.category,
      isActive: isActive ?? this.isActive,
      parentId: parentId ?? this.parentId,  
      groupId: groupId ?? this.groupId,
      birthdate: birthdate ?? this.birthdate,
      gender: gender ?? this.gender,
      avatar: avatar ?? this.avatar,
      media: media ?? this.media,
    );
  }
}
