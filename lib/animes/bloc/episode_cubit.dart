import 'package:umai/animes/models/episode.dart';
import 'package:umai/animes/services/episode_service.dart';
import 'package:umai/common/bloc/common_cubit.dart';

class EpisodeCubit extends XCommonCubit<Episode> {
  final EpisodeService episodeService;

  EpisodeCubit(this.episodeService, Episode episode)
      : super(episodeService, episode);
}
