import 'package:equatable/equatable.dart';

class PlaylistList with EquatableMixin {
  int id;
  String arTitle;
  String enTitle;
  String image;
  String soundLink;
  String spotifyLink;
  String titokLink;
  String youtubeLink;
  String isActive;
  String createdAt;
  String updatedAt;
  String episodesCount;

  PlaylistList({
    required this.id,
    required this.arTitle,
    required this.enTitle,
    required this.image,
    required this.soundLink,
    required this.spotifyLink,
    required this.titokLink,
    required this.youtubeLink,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.episodesCount,
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
        updatedAt,
        episodesCount
      ];

  factory PlaylistList.fromJson(Map<String, dynamic> json) {
    return PlaylistList(
      id: json['id'] as int,
      arTitle: json['ar_title'] as String,
      enTitle: json['en_title'] as String,
      image: json['image'] as String,
      soundLink: json['sound_link'] as String,
      spotifyLink: json['spotify_link'] as String,
      titokLink: json['titok_link'] as String,
      youtubeLink: json['youtube_link'] as String,
      isActive: json['is_active'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      episodesCount: json['episodes_count'] as String,
    );
  }
}
