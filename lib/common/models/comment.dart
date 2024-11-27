import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:umai/common/bloc/report_cubit.dart';
import 'package:umai/common/models/user.dart';
import 'package:umai/utils/datetime_converter.dart';

part 'comment.freezed.dart';
part 'comment.g.dart';

@freezed
class Comment with _$Comment, XReportedItem {
  const Comment._();
  factory Comment({
    required String id,
    required String content,
    @JsonKey(name: 'has_liked') required bool hasLiked,
    @JsonKey(name: 'comment_responses_count')
    required int commentResponsesCount,
    required User user,
    @JsonKey(name: 'created_at')
    @DateTimeConverter()
    required DateTime createdAt,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
  @override
  String get itemId => id;
}
