import 'package:potatoes/auto_list.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/animes/models/anime.dart';
import 'package:umai/animes/services/anime_cubit_manager.dart';
import 'package:umai/common/services/user_service.dart';

class UserAnimeCubit extends AutoListCubit<Anime> {
  final UserService userService;
  final AnimeCubitManager cubitManager;
  final String? userId;
  UserAnimeCubit({
    required this.cubitManager,
    required this.userService,
    this.userId,
  }) : super(
            provider: ({page = 1}) => userService.getAnimeViewed(
                  page: page,
                  userId: userId,
                ));

  @override
  void onChange(Change<AutoListState<Anime>> change) {
    super.onChange(change);
    if (change.nextState is AutoListReadyState<Anime>) {
      cubitManager
          .addAll((change.nextState as AutoListReadyState<Anime>).items.items);
    }
  }
}
