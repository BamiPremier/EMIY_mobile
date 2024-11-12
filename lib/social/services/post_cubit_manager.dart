import 'package:potatoes/common/bloc/cubit_manager.dart';
import 'package:umai/common/services/person_cubit_manager.dart'; 
import 'package:umai/social/bloc/post_cubit.dart';
import 'package:umai/social/models/post.dart';
import 'package:umai/social/services/social_service.dart';

class PostCubitManager extends CubitManager<PostCubit, Post, String> {
  final SocialService socialService;
  final PersonCubitManager personCubitManager;

  PostCubitManager(this.socialService, this.personCubitManager);

  @override
  String buildId(Post object) {
    return object.id;
  }

  @override
  PostCubit create(Post object) {
    personCubitManager.add(object.user);
    return PostCubit(socialService, object);
  }

  @override
  void updateCubit(PostCubit cubit, Post object) {
    cubit.update(object);
  }
}
