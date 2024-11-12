import 'package:potatoes/common/bloc/cubit_manager.dart';
import 'package:umai/animes/bloc/episode_cubit.dart';
import 'package:umai/animes/models/episode.dart';
import 'package:umai/animes/services/episode_service.dart';
import 'package:umai/common/services/person_cubit_manager.dart';
import 'package:umai/social/bloc/post_cubit.dart';
import 'package:umai/social/models/post.dart';
import 'package:umai/social/services/social_service.dart';

class EpisodeCubitManager extends CubitManager<EpisodeCubit, Episode, String> {
  final EpisodeService episodeService;
  EpisodeCubitManager(this.episodeService);

  @override
  String buildId(Episode object) {
    return object.id.toString();
  }

  @override
  EpisodeCubit create(Episode object) {
    return EpisodeCubit(episodeService, object);
  }

  @override
  void updateCubit(EpisodeCubit cubit, Episode object) {
    cubit.update(object);
  }
}
