import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:umai/common/bloc/repport_cubit.dart';
import 'package:umai/common/models/user.dart';
import 'package:umai/common/screens/common_details.dart';
import 'package:umai/utils/datetime_converter.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
class Post with _$Post, XItem, XReportedItem {
  const Post._();
  const factory Post({
    required String id,
    required String content,
    String? image,
    @JsonKey(name: 'has_liked') @Default(false) bool hasLiked,
    @JsonKey(name: 'comments_count') @Default(0) int commentsCount,
    required User user,
    @Default(false) bool reported,
    @JsonKey(name: 'created_at')
    @DateTimeConverter()
    required DateTime createdAt,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  @override
  String get itemId => id;
  @override
  String get itemContent => content;
  @override
  String? get itemImage => image;
  @override
  bool get itemHasLiked => hasLiked;
  @override
  int get itemCommentsCount => commentsCount;
  @override
  User get itemUser => user;
  @override
  bool get itemReported => reported;
  @override
  DateTime get itemCreatedAt => createdAt;

  @override
  Post copyWithLike({bool? hasLiked}) =>
      copyWith(hasLiked: hasLiked ?? this.hasLiked);
      
  @override
  Post copyWithCommentsCount({bool increment = true}) {
    final newCount = increment ? commentsCount + 1 : commentsCount - 1;
    return copyWith(commentsCount: newCount < 0 ? 0 : newCount);
  }
}
