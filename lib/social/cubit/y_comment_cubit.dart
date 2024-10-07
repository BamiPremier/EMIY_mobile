
import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart' hide PreferencesService;
import 'package:umai/social/model/comment.dart'; 

part 'y_comment_state.dart';

class YCommentCubit extends Cubit<YCommentState> {
  YCommentCubit() : super(const YCommentIdleState());

  void selectComment(Comment? comment) {
    emit(YCommentSelectedState(comment));
  }

  void unselectComment() {
    emit(const YCommentIdleState());
  }
}
