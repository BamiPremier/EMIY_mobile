import 'package:potatoes/libs.dart';
import 'package:umai/animes/models/anime.dart';
import 'package:umai/animes/services/anime_service.dart';

import 'package:potatoes/potatoes.dart';
part 'anime_manip_state.dart';

class AnimeManipCubit extends ObjectCubit<Anime, AnimeManipState> {
  final AnimeService animeService;

  AnimeManipCubit(this.animeService, Anime anime)
      : super(InitializingAnimeManipState(anime));

  @override
  Anime? getObject(AnimeManipState state) {
    if (state is InitializingAnimeManipState) {
      return state.anime;
    }
    return null;
  }

  Anime get anime {
    final anime = getObject(state) ?? object;

    if (anime != null) return anime;
    throw UnsupportedError(
        'cannot retrieve anime: Current state is ${state.runtimeType}');
  }

  @override
  void update(Anime object) {
    emit(InitializingAnimeManipState(object));
  }

  void addToWatchlist() {
    final stateBefore = state;

    emit(const AnimeManipWatchlistLoadingState());
    animeService
        .addToWatchList(
      anime: anime.id,
    )
        .then((updateAnime) {
      emit(WatchListAddSuccesState());
      update(updateAnime);
    }, onError: (error, trace) {
      emit(AnimeManipErrorState(error, trace));
      emit(stateBefore);
    });
  }

  void addToViewed() {
    final stateBefore = state;

    emit(const AnimeManipViewedLoadingState());
    animeService.addToViewerList(anime: anime.id).then((updateAnime) {
      emit(AnimeViewedAddSuccesState());
      update(updateAnime);
    }, onError: (error, trace) {
      emit(AnimeManipErrorState(error, trace));
      emit(stateBefore);
    });
  }

  void removeFromViewed() {
    final stateBefore = state;

    emit(const AnimeManipViewedLoadingState());
    animeService.removeFromViewed(anime: anime.id).then((updateAnime) {
      emit(AnimeViewedAddSuccesState());
      update(updateAnime);
    }, onError: (error, trace) {
      emit(AnimeManipErrorState(error, trace));
      emit(stateBefore);
    });
  }

  void removeFromWatchlist() {
    final stateBefore = state;

    emit(const AnimeManipWatchlistLoadingState());
    animeService
        .removeFromWatchList(
      anime: anime.id,
    )
        .then((updateAnime) {
      emit(WatchListAddSuccesState());
      update(updateAnime);
    }, onError: (error, trace) {
      emit(AnimeManipErrorState(error, trace));
      emit(stateBefore);
    });
  }

  void shareAnime () {
    if (state is InitializingAnimeManipState) {
      final stateBefore = state;

        emit(const ShareAnimeLoadingState());
      animeService
          .shareAnime(
        idAnime: anime.id,
      )
          .then((reponse) {
        emit(ShareAnimeSuccesState(reponse['shareLink']));
        emit(InitializingAnimeManipState(anime));
      }, onError: (error, trace) {
        emit(AnimeManipErrorState(error, trace));
        emit(stateBefore);
      });
    }
  }
}
