import 'package:potatoes/auto_list.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/animes/models/anime.dart';
import 'package:umai/animes/models/episode.dart';
import 'package:umai/animes/services/anime_cubit_manager.dart';
import 'package:umai/animes/services/anime_service.dart';

class SimilarAnimeCubit extends AutoListCubit<Anime> {
  final AnimeCubitManager cubitManager;
  final AnimeService animeService;
  final String anime;
  SimilarAnimeCubit(this.cubitManager, this.animeService, this.anime,
      [int? size])
      : super(
            provider: ({page = 1}) => animeService.getSimilarAnime(
                page: page, size: size, anime: anime));
  @override
  void onChange(Change<AutoListState<Anime>> change) {
    super.onChange(change);
    if (change.nextState is AutoListReadyState<Anime>) {
      cubitManager
          .addAll((change.nextState as AutoListReadyState<Anime>).items.items);
    }
  }
}
