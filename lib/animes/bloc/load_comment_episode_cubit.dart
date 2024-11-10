import 'package:potatoes/auto_list/bloc/auto_list_cubit.dart';
import 'package:potatoes/auto_list/models/paginated_list.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/animes/bloc/load_episode_anime_cubit.dart';
import 'package:umai/social/model/comment.dart';

import 'package:umai/animes/services/anime_service.dart';
import 'package:umai/animes/services/episode_service.dart';
import 'package:umai/common/services/person_cubit_manager.dart';

class LoadCommentEpisodeCubit extends AutoListCubit<Comment> {
  final EpisodeService episodeService;
  final PersonCubitManager personCubitManager;
  final LoadEpisodeAnimeCubit loadEpisodeAnimeCubit;
  final int idEpisode;
  final String target;

  LoadCommentEpisodeCubit(this.episodeService, this.idEpisode, this.target,
      this.loadEpisodeAnimeCubit, this.personCubitManager)
      : super(provider: ({int page = 1}) async {
          final p = await episodeService.getComments(
              idItem: idEpisode.toString(), target: target, page: page);
          return p;
        });

  @override
  void onChange(Change<AutoListState<Comment>> change) {
    super.onChange(change);
    if (change.nextState is AutoListReadyState<Comment>) {
      for (var comment
          in (change.nextState as AutoListReadyState<Comment>)
              .items
              .items) {
        personCubitManager.add(comment.user);
      }
    }
  }

  void putFirst(Comment comment) {
    if (state is LoadLoadCommentEpisodeCubitReadyState) {
      final list = (state as LoadLoadCommentEpisodeCubitReadyState).items;

      emit(LoadLoadCommentEpisodeCubitReadyState(
          list.prepend(others: [comment])));
    }
  }

  void deleteCommentEpisode(Comment comment) {
    if (state is LoadLoadCommentEpisodeCubitReadyState) {
      final list = (state as LoadLoadCommentEpisodeCubitReadyState).items;

      episodeService.deleteCommentEpisode(commentId: comment.id).then((_) {
        emit(LoadLoadCommentEpisodeCubitReadyState(PaginatedList(
          items: List.from(list.items)..removeWhere((c) => c.id == comment.id),
          total: list.total - 1,
          page: list.page,
        )));
        loadEpisodeAnimeCubit.updateCommentCount(
            idEpisode: idEpisode, isIncrement: false);
      }, onError: (error) {
        // emit(LoadCommentErrorState(error));
      });
    }
  }
}

typedef LoadCommentEpisodeState = AutoListState<Comment>;
typedef LoadLoadCommentEpisodeCubitReadyState
    = AutoListReadyState<Comment>;
