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

  void updateCommentCount({required int idEpisode, required bool isIncrement}) {
    if (state is EpisodeAnimeReadyState) {
      final list = (state as EpisodeAnimeReadyState).items.items;
      final newList = list.map((e) {
        if (e.id == idEpisode) {
          return e.copyWith(
              commentsCount: e.commentsCount +
                  (isIncrement
                      ? 1
                      : e.commentsCount > 0
                          ? -1
                          : 0));
        }
        return e;
      }).toList();
      emit(AutoListReadyState(PaginatedList(
        items: newList,
        page: 1,
        total: list.length,
      )));
    }
  }
}

typedef EpisodeAnimeState = AutoListState<Episode>;
typedef EpisodeAnimeReadyState = AutoListReadyState<Episode>;
