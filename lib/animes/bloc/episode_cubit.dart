import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:umai/animes/bloc/load_episode_anime_cubit.dart';
import 'package:umai/animes/models/comment_episode.dart';
import 'package:umai/animes/models/episode.dart';
import 'package:umai/animes/services/anime_service.dart';
import 'package:umai/animes/services/episode_service.dart';

part 'episode_state.dart';

class EpisodeCubit extends ObjectCubit<Episode, EpisodeState> {
  final EpisodeService episodeService;

  EpisodeCubit(this.episodeService, Episode episode)
      : super(InitializingEpisodeState(episode));

  @override
  Episode? getObject(EpisodeState state) {
    if (state is InitializingEpisodeState) {
      return state.episode;
    }
    return null;
  }

  Episode get episode {
    final episode = getObject(state) ?? object;

    if (episode != null) return episode;
    throw UnsupportedError(
        'cannot retrieve episode: Current state is ${state.runtimeType}');
  }

  @override
  void update(Episode object) {
    emit(InitializingEpisodeState(object));
  }

  reset() {
    update(episode);
  }

  void likeEpisode() {
    if (state is InitializingEpisodeState) {
      final stateBefore = state;
      var newEpisode = episode.copyWith(hasLiked: !episode.hasLiked);
      update(newEpisode);
      episodeService
          .likeEpisode(
        idEpisode: episode.id,
      )
          .then((updateepisode) {}, onError: (error, trace) {
        emit(EpisodeErrorState(error, trace));
        emit(stateBefore);
      });
    }
  }

  void unLikeEpisode() {
    if (state is InitializingEpisodeState) {
      final stateBefore = state;
      var newEpisode = episode.copyWith(hasLiked: !episode.hasLiked);
      update(newEpisode);
      episodeService
          .unLikeEpisode(
        idEpisode: episode.id,
      )
          .then((updateepisode) {}, onError: (error, trace) {
        emit(EpisodeErrorState(error, trace));
        emit(stateBefore);
      });
    }
  }

  void shareEpisode() {
    if (state is InitializingEpisodeState) {
      final stateBefore = state;

      emit(const ShareEpisodeLoadingState());
      episodeService
          .shareEpisode(
        idEpisode: episode.id,
      )
          .then((reponse) {
        emit(ShareEpisodeSuccesState(reponse['shareLink']));
        emit(InitializingEpisodeState(episode));
      }, onError: (error, trace) {
        emit(EpisodeErrorState(error, trace));
        emit(stateBefore);
      });
    }
  }

  void report({required String reason}) {
    if (state is InitializingEpisodeState) {
      // final stateBefore = state;
      // emit(const SendRepportLoadingState());
      // episodeService
      //     .reportEpisode(
      //   idEpisode: episode.id,
      //   reason: reason,
      // )
      //     .then((_) {

      //   emit(SuccessSendRepportEpisodeState(episode));
      // }, onError: (error, trace) {
      //   emit(EpisodeErrorState(error, trace));
      //   emit(stateBefore);
      // });
    }
  }

  void delete() {
    if (state is InitializingEpisodeState) {
      // final stateBefore = state;

      // episodeService
      //     .deleteEpisode(
      //   idEpisode: episode.id,
      // )
      //     .then((updateEpisode) {}, onError: (error, trace) {
      //   emit(EpisodeErrorState(error, trace));
      //   emit(stateBefore);
      // });
    }
  }

  void commentEpisode({
    required String content,
    String? targetCommentId,
    required LoadEpisodeAnimeCubit loadEpisodeAnimeCubit,
  }) {
    if (state is InitializingEpisodeState) {
      final stateBefore = state;

      emit(const EpisodeLoadingState());
      episodeService
          .commentEpisode(
              idEpisode: episode.id,
              content: content.trim(),
              target: targetCommentId)
          .then((comment) {
        emit(CommentEpisodeSuccesState(comment));
        emit(stateBefore);
        loadEpisodeAnimeCubit.updateCommentCount(
            idEpisode: episode.id, isIncrement: true);
      }, onError: (error, trace) {
        emit(EpisodeErrorState(error, trace));
        emit(stateBefore);
      });
    }
  }
}
