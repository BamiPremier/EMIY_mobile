import 'package:potatoes/auto_list.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/animes/models/anime.dart';
import 'package:umai/animes/services/anime_cubit_manager.dart';
import 'package:umai/auth/services/auth_service.dart';

class AnimeByGenreCubit extends AutoListCubit<Anime> {
  final AuthService authService;
  final AnimeCubitManager cubitManager;
  final String selectedTarget;
  AnimeByGenreCubit({
    required this.cubitManager,
    required this.authService,
    required this.selectedTarget,
  }) : super(
            provider: ({page = 1}) => authService.getAnimes(
                  page: page,
                  selectedTarget: selectedTarget,
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

abstract class AvailableValues {
  static const watchlist = "WATCHLIST";
  static const viewed = "VIEWED";
}
