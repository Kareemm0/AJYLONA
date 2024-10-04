import 'package:equatable/equatable.dart';

class Episodes with EquatableMixin {
  int? id;
  String? arTitle;
  String? enTitle;
  String? arDescription;
  String? enDescription;
  String? number;
  String? time;
  String? video;
  String? soundLink;
  String? spotifyLink;
  String? titokLink;
  String? youtubeLink;
  String? isActive;
  String? playlistId;
  String? createdAt;
  String? updatedAt;
  String? homeShow;

  Episodes({
    this.id,
    this.arTitle,
    this.enTitle,
    this.arDescription,
    this.enDescription,
    this.number,
    this.time,
    this.video,
    this.soundLink,
    this.spotifyLink,
    this.titokLink,
    this.youtubeLink,
    this.isActive,
    this.playlistId,
    this.createdAt,
    this.updatedAt,
    this.homeShow,
  });

  @override
  List<Object?> get props => [
        id,
        arTitle,
        enTitle,
        arDescription,
        enDescription,
        number,
        time,
        video,
        soundLink,
        spotifyLink,
        titokLink,
        youtubeLink,
        isActive,
        playlistId,
        createdAt,
        updatedAt,
        homeShow
      ];

  factory Episodes.fromJson(Map<String, dynamic> json) {
    return Episodes(
      id: json['id'] as int?,
      arTitle: json['ar_title'] as String?,
      enTitle: json['en_title'] as String?,
      arDescription: json['ar_description'] as String?,
      enDescription: json['en_description'] as String?,
      number: json['number'] as String?,
      time: json['time'] as String?,
      video: json['video'] as String?,
      soundLink: json['sound_link'] as String?,
      spotifyLink: json['spotify_link'] as String?,
      titokLink: json['titok_link'] as String?,
      youtubeLink: json['youtube_link'] as String?,
      isActive: json['is_active'] as String?,
      playlistId: json['playlist_id'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      homeShow: json['home_show'] as String?,
    );
  }
}
