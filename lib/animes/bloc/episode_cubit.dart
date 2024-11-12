import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:umai/animes/bloc/load_episode_anime_cubit.dart';
import 'package:umai/common/bloc/common_cubit.dart';
import 'package:umai/common/models/comment.dart';

import 'package:umai/animes/models/episode.dart';
import 'package:umai/animes/services/anime_service.dart';
import 'package:umai/animes/services/episode_service.dart';

class EpisodeCubit extends XCommonCubit<Episode> {
  final EpisodeService episodeService;

  EpisodeCubit(this.episodeService, Episode episode)
      : super(episodeService, episode);

  reset() {
    update(x);
  }

  void commentEpisode(
      {required String content,
      String? targetCommentId,
      required LoadEpisodeAnimeCubit loadEpisodeAnimeCubit}) {
    if (state is InitializingXCommonState) {
      final stateBefore = state;

      emit(const XLoadingState());
      service
          .commentItem(
              idItem: x.itemId,
              content: content.trim(),
              target: targetCommentId)
          .then((comment) {
        loadEpisodeAnimeCubit.updateCommentCount(
            idEpisode: int.parse(x.itemId), isIncrement: true);
        emit(CommentItemSuccesState(comment));
        emit(stateBefore);
      }, onError: (error, trace) {
        emit(XErrorState(error, trace));
        emit(stateBefore);
      });
    }
  }
}
