import 'package:potatoes/auto_list.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/animes/models/anime.dart';
import 'package:umai/animes/services/anime_cubit_manager.dart';
import 'package:umai/animes/services/anime_service.dart'; 

class CategoryAnimeCubit extends AutoListCubit<Anime> {
  final AnimeService animeService;
  final AnimeCubitManager cubitManager;
  final String selectedFilter;
  CategoryAnimeCubit(
    this.cubitManager,
    this.animeService,
    this.selectedFilter,
    [int? size]
  ) : super(
        provider: ({page = 1}) => animeService.getAnimesFeed(
          page: page,
          size: size,
          selectedFilter: selectedFilter
        )
  );

  @override
  void onChange(Change<AutoListState<Anime>> change) {
    super.onChange(change);
    if (change.nextState is AutoListReadyState<Anime>) {
      cubitManager
          .addAll((change.nextState as AutoListReadyState<Anime>).items.items);
    }
  }
}
