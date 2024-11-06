import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:umai/common/models/user.dart';
import 'package:umai/utils/datetime_converter.dart';

part 'comment_episode.freezed.dart';
part 'comment_episode.g.dart';

@freezed
class CommentEpisode with _$CommentEpisode {
  factory CommentEpisode  ({
    required String id,
    required String content,
    @JsonKey(name: 'has_liked') required bool hasLiked,
    @JsonKey(name: 'comment_responses_count')
    required int commentResponsesCount,
    required User user,
    @JsonKey(name: 'created_at') 
    @DateTimeConverter()
    required DateTime createdAt,
  }) = _CommentEpisode;

  factory CommentEpisode.fromJson(Map<String, dynamic> json) =>
      _$CommentEpisodeFromJson(json);
}
