import 'package:potatoes/auto_list.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/animes/models/anime.dart';
import 'package:umai/animes/services/anime_cubit_manager.dart';
import 'package:umai/animes/services/anime_service.dart';
import 'package:umai/auth/services/auth_service.dart';
import 'package:umai/common/services/user_service.dart';

class AnimeByGenreCubit extends AutoListCubit<Anime> {
  final AuthService authService;
  final AnimeCubitManager cubitManager;
  final List<String> genres;
  AnimeByGenreCubit({
    required this.cubitManager,
    required this.authService,
    required this.genres,
  }) : super(
            provider: ({page = 1}) => authService.getAnimes(
                  page: page,
                  genres: genres,
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
