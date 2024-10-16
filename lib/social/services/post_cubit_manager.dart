import 'package:potatoes/common/bloc/cubit_manager.dart';
import 'package:umai/social/bloc/post_cubit.dart';
import 'package:umai/social/model/post.dart';
import 'package:umai/social/services/social_service.dart';

class PostCubitManager extends CubitManager<PostCubit, Post, String> {
  final SocialService socialService;

  PostCubitManager(this.socialService);

  @override
  String buildId(Post object) {
    return object.id;
  }

  @override
  PostCubit create(Post object) {
    return PostCubit(socialService, object);
  }

  @override
  void updateCubit(PostCubit cubit, Post object) {
    cubit.update(object);
  }
}