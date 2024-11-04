import 'package:potatoes/auto_list.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/animes/models/anime.dart';
import 'package:umai/animes/models/episode.dart';
import 'package:umai/animes/services/anime_cubit_manager.dart';
import 'package:umai/animes/services/anime_service.dart';

class EpisodeAnimeCubit extends AutoListCubit<Episode> {
  final AnimeService animeService;
  final String anime;
  EpisodeAnimeCubit(this.animeService, this.anime, [int? size])
      : super(
            provider: ({page = 1}) => animeService.getEpisodeAnime(
                page: page, size: size, anime: anime));
}
