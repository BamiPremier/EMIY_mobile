import 'package:potatoes/auto_list.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/common/services/person_cubit_manager.dart';
import 'package:umai/social/model/post.dart';
import 'package:umai/social/services/post_cubit_manager.dart';
import 'package:umai/social/services/social_service.dart';

class PostFeedCubit extends AutoListCubit<Post> {
  final SocialService socialService;
  final PersonCubitManager personCubitManager;
  final PostCubitManager cubitManager;

  PostFeedCubit(
    this.socialService,
    this.cubitManager,
    this.personCubitManager,
  ) : super(provider: socialService.getFeed);

  @override
  void onChange(Change<AutoListState<Post>> change) {
    super.onChange(change);
    if (change.nextState is AutoListReadyState<Post>) {
      cubitManager
          .addAll((change.nextState as AutoListReadyState<Post>).items.items);
      for (var post
          in (change.nextState as AutoListReadyState<Post>).items.items) {
        personCubitManager.add(post.user);
      }
    }
  }
}
