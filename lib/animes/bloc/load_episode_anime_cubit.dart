import 'package:potatoes/auto_list.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/animes/models/episode.dart';
import 'package:umai/animes/services/anime_service.dart';
import 'package:umai/animes/services/episode_cubit_manager.dart';

class LoadEpisodeAnimeCubit extends AutoListCubit<Episode> {
  final EpisodeCubitManager cubitManager;
  final AnimeService animeService;
  final String anime;
  LoadEpisodeAnimeCubit(this.cubitManager, this.animeService, this.anime,
      [int? size])
      : super(
            provider: ({page = 1}) => animeService.getEpisodeAnime(
                page: page, size: size, anime: anime));

  @override
  void onChange(Change<AutoListState<Episode>> change) {
    super.onChange(change);
    if (change.nextState is AutoListReadyState<Episode>) {
      cubitManager.addAll(
          (change.nextState as AutoListReadyState<Episode>).items.items);
    }
  }
 
}

typedef EpisodeAnimeState = AutoListState<Episode>;
typedef EpisodeAnimeReadyState = AutoListReadyState<Episode>;
