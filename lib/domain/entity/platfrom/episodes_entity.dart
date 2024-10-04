import 'package:equatable/equatable.dart';
import 'playlists.dart';

class EpisodesEntity with EquatableMixin {
  Playlist? playlist;
  List<Episodes>? episodes;

  EpisodesEntity({
    this.playlist,
    this.episodes,
  });

  @override
  List<Object?> get props => [
        playlist,
        episodes,
      ];

  factory EpisodesEntity.fromJson(Map<String, dynamic> json) {
    return EpisodesEntity(
      playlist: json['playlist'] == null
          ? null
          : Playlist.fromJson(json['playlist'] as Map<String, dynamic>),
      episodes: (json['episodes'] as List<dynamic>?)
          ?.map((e) => Episodes.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class Playlist with EquatableMixin {
  int? id;
  String? arTitle;
  String? enTitle;
  String? image;
  String? soundLink;
  String? spotifyLink;
  String? titokLink;
  String? youtubeLink;
  String? isActive;
  String? createdAt;
  String? updatedAt;

  Playlist({
    this.id,
    this.arTitle,
    this.enTitle,
    this.image,
    this.soundLink,
    this.spotifyLink,
    this.titokLink,
    this.youtubeLink,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        arTitle,
        enTitle,
        image,
        soundLink,
        spotifyLink,
        titokLink,
        youtubeLink,
        isActive,
        createdAt,
        updatedAt
      ];

  factory Playlist.fromJson(Map<String, dynamic> json) {
    return Playlist(
      id: json['id'] as int?,
      arTitle: json['ar_title'] as String?,
      enTitle: json['en_title'] as String?,
      image: json['image'] as String?,
      soundLink: json['sound_link'] as String?,
      spotifyLink: json['spotify_link'] as String?,
      titokLink: json['titok_link'] as String?,
      youtubeLink: json['youtube_link'] as String?,
      isActive: json['is_active'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );
  }
}
