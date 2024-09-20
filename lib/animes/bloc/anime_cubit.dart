import 'dart:developer';

import 'package:potatoes/auto_list/models/paginated_list.dart';
import 'package:umai/animes/services/anime_service.dart';
import 'package:umai/common/models/anime_response.dart';
import 'package:umai/auth/services/auth_service.dart';
import 'package:umai/common/bloc/user_cubit.dart';
import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:umai/common/models/episode_response.dart';

part 'anime_state.dart';

class AnimeCubit extends Cubit<AnimeState> {
  final UserCubit userCubit;
  final AnimeService service;

  AnimeCubit(this.userCubit, this.service) : super(const AnimeIdleState());
  Future<PaginatedList<Anime>> getAnimes({int page = 1}) {
    return service.getAnimes(page: page).then((p) {
      print('==================p$p');
      return PaginatedList(items: p.content, page: p.page, total: p.total);
    });
  }

  Future<PaginatedList<Episode>> getEpisodesAnime(
      {int page = 1, required String anime}) {
    return service.getEpisodesAnime(anime: anime, page: page).then((p) {
      print('==================p$p');
      return PaginatedList(items: p.content, page: p.page, total: p.total);
    });
  }

  Future<PaginatedList<Anime>> getAnimesByGenre(
      {required String genre, int page = 1}) {
    return service.getAnimesByGenre(genre: genre, page: page).then((p) {
      print('==================p$p');
      return PaginatedList(items: p.content, page: p.page, total: p.total);
    });
  }
}
