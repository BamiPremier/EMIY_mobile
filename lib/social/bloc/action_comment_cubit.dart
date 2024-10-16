
import 'package:potatoes/potatoes.dart' hide PreferencesService;
import 'package:umai/social/bloc/post_cubit.dart';
import 'package:umai/social/model/comment.dart';

class ActionCommentCubit extends ValueCubit<Comment?> {
  final PostCubit postCubit;
  ActionCommentCubit(this.postCubit) : super(null);

  void commentPost({
    required String content,
  }) {
    postCubit.commentPost(content: content, targetCommentId: state?.id);
  }
}
