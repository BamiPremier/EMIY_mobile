import 'package:potatoes/common/bloc/cubit_manager.dart';
import 'package:umai/animes/bloc/episode_cubit.dart';
import 'package:umai/animes/models/episode.dart';
import 'package:umai/animes/services/anime_cubit_manager.dart';
import 'package:umai/animes/services/episode_service.dart';

class EpisodeCubitManager extends CubitManager<EpisodeCubit, Episode, String> {
  final EpisodeService episodeService;
  final AnimeCubitManager animeCubitManager;

  EpisodeCubitManager(this.episodeService, this.animeCubitManager);

  @override
  String buildId(Episode object) {
    return object.id.toString();
  }

  @override
  EpisodeCubit create(Episode object) {
    animeCubitManager.add(object.anime);
    return EpisodeCubit(episodeService, object);
  }

  @override
  void updateCubit(EpisodeCubit cubit, Episode object) {
    animeCubitManager.add(object.anime);
    cubit.update(object);
  }
}
