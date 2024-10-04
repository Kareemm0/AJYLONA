import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final UserLogin user;
  final String token;

  const UserEntity({
    required this.user,
    required this.token,
  });

  @override
  List<Object?> get props => [user, token];

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      user: UserLogin.fromJson(json['user']),
      token: json['token'] as String,
    );
  }
  UserEntity copyWith({
    UserLogin? userlogin,
    String? token,
  }) {
    return UserEntity(
      user: userlogin ?? user,
      token: token ?? this.token,
    );
  }
}

class UserLogin extends Equatable {
  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? name;
  final String? email;
  final DateTime? emailVerifiedAt;
  final String? phone;
  final DateTime? phoneVerifiedAt;
  final String? picture;
  final String? category;
  final dynamic isActive;
  final int? parentId;
  final int? groupId;
  final DateTime? birthdate;
  final String? gender;
  final String? avatar;
  final List<dynamic>? media;

  const UserLogin({
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
        media,
      ];

  factory UserLogin.fromJson(Map<String, dynamic> json) {
    return UserLogin(
      id: json['id'] as int,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      name: json['name'] as String,
      email: json['email'] as String?,
      emailVerifiedAt: json['email_verified_at'] != null
          ? DateTime.parse(json['email_verified_at'] as String)
          : null,
      phone: json['phone'] as String,
      phoneVerifiedAt: json['phone_verified_at'] != null
          ? DateTime.parse(json['phone_verified_at'] as String)
          : null,
      picture: json['picture'] as String?,
      category: json['category'] as String,
      isActive: json['is_active'],
      parentId: json['parent_id'] as int?,
      groupId: json['group_id'] as int?,
      birthdate: json['birthdate'] != null
          ? DateTime.parse(json['birthdate'] as String)
          : null,
      gender: json['gender'] as String?,
      avatar: json['avatar'] as String?,
      media: List<dynamic>.from(json['media'] as List),
    );
  }
  UserLogin copyWith({
    int? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? name,
    String? email,
    DateTime? emailVerifiedAt,
    String? phone,
    DateTime? phoneVerifiedAt,
    String? picture,
    String? category,
    dynamic isActive,
    int? parentId,
    int? groupId,
    DateTime? birthdate,
    String? gender,
    String? avatar,
    List<dynamic>? media,
  }) {
    return UserLogin(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      name: name ?? this.name,
      email: email ?? email,
      emailVerifiedAt: emailVerifiedAt ?? emailVerifiedAt,
      phone: phone ?? this.phone,
      phoneVerifiedAt: phoneVerifiedAt ?? phoneVerifiedAt,
      picture: picture ?? picture,
      category: category ?? this.category,
      isActive: isActive,
      parentId: parentId,
      groupId: groupId ?? groupId,
      birthdate: birthdate ?? birthdate,
      gender: gender ?? gender,
      avatar: avatar ?? avatar,
      media: media ?? this.media,
    );
  }
}
