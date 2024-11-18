import 'package:potatoes/auto_content/bloc/auto_content_cubit.dart';
import 'package:potatoes/auto_list.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/animes/models/anime.dart';
import 'package:umai/animes/services/anime_cubit_manager.dart';
import 'package:umai/animes/services/anime_service.dart';
import 'package:umai/auth/services/auth_service.dart';

class AnimeSearchCubit extends AutoListCubit<Anime> {
  final AnimeService animeService;
  final AnimeCubitManager cubitManager;
  final String search;
  AnimeSearchCubit({
    required this.animeService,
    required this.cubitManager,
    required this.search,
  }) : super(
            provider: ({page = 1}) => animeService.getAnimesSearch(
                  page: page,
                  search: search,
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
