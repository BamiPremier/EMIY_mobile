import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:umai/animes/models/anime.dart';

part 'episode.freezed.dart';
part 'episode.g.dart';

@freezed
class Episode with _$Episode {
  const factory Episode({
    required int id,
    required int airingAt,
    required int timeUntilAiring,
    required int episode,
    required Anime anime,
    @JsonKey(name: 'has_liked') @Default(false) bool hasLiked,
    @JsonKey(name: 'comments_count') @Default(0) int commentsCount,
  }) = _Episode;

  factory Episode.fromJson(Map<String, dynamic> json) =>
      _$EpisodeFromJson(json);
}
