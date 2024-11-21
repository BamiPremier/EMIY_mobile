import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:umai/animes/models/anime.dart';
import 'package:umai/common/models/user.dart';
import 'package:umai/common/screens/common_details.dart';

part 'episode.freezed.dart';
part 'episode.g.dart';

@freezed
class Episode with _$Episode, XItem {
  const Episode._();
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

  @override
  int get itemCommentsCount => commentsCount;

  @override
  String get itemId => id.toString();

  @override
  bool get itemHasLiked => hasLiked;

  @override
  bool get itemReported => false;

  @override
  DateTime get itemCreatedAt => DateTime.fromMillisecondsSinceEpoch(airingAt);

  @override
  String get itemContent => 'Episode $episode of ${anime.title}';

  @override
  String get itemImage => "anime.imageUrl";

  @override
  User? get itemUser => null;

  @override
  Episode copyWithLike({bool? hasLiked}) =>
      copyWith(hasLiked: hasLiked ?? this.hasLiked);
}
