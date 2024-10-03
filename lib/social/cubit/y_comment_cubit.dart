import 'dart:async';
import 'dart:io';

import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart' hide PreferencesService;
import 'package:umai/social/model/comment.dart';
import 'package:umai/social/model/post.dart';
import 'package:umai/social/services/social_service.dart';

part 'y_comment_state.dart';

class YCommentCubit extends Cubit<YCommentState> {
  YCommentCubit() : super(const YCommentIdleState());

  void selectComment(Comment comment) {
    emit(YCommentSelectedState(comment));
  }

  void unselectComment() {
    emit(YCommentIdleState());
  }
}
