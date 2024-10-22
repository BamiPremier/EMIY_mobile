import 'package:potatoes/auto_list.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/common/services/user_service.dart';
import 'package:umai/social/model/post.dart';
import 'package:umai/social/services/post_cubit_manager.dart'; 

class PostUserCubit extends AutoListCubit<Post> {
  final UserService userService;
  final PostCubitManager cubitManager;

  PostUserCubit(this.userService, this.cubitManager)
      : super(provider: userService.getPosts);

  @override
  void onChange(Change<AutoListState<Post>> change) {
    super.onChange(change);
    if (change.nextState is AutoListReadyState<Post>) {
      cubitManager
          .addAll((change.nextState as AutoListReadyState<Post>).items.items);
    }
  }
}
