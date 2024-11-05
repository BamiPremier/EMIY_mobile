import 'package:potatoes/auto_list/bloc/auto_list_cubit.dart';
import 'package:potatoes/auto_list/models/paginated_list.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/animes/models/comment_episode.dart';
import 'package:umai/animes/services/anime_service.dart';
import 'package:umai/common/services/person_cubit_manager.dart';


class LoadCommentEpisodeCubit extends AutoListCubit<CommentEpisode> {
  final AnimeService animeService;
  final PersonCubitManager personCubitManager;

  LoadCommentEpisodeCubit(this.animeService, int idEpisode, String target,
      this.personCubitManager)
      : super(provider: ({int page = 1}) async {
          final p = await animeService.getCommentsEpisode(
              idEpisode: idEpisode, target: target, page: page);
          return p;
        });

  @override
  void onChange(Change<AutoListState<CommentEpisode>> change) {
    super.onChange(change);
    if (change.nextState is AutoListReadyState<CommentEpisode>) {
      for (var comment
          in (change.nextState as AutoListReadyState<CommentEpisode>)
              .items
              .items) {
        personCubitManager.add(comment.user);
      }
    }
  }

  void putFirst(CommentEpisode comment) {
    if (state is LoadLoadCommentEpisodeCubitReadyState) {
      final list = (state as LoadLoadCommentEpisodeCubitReadyState).items;

      emit(LoadLoadCommentEpisodeCubitReadyState(
          list.prepend(others: [comment])));
    }
  }

  void deleteCommentEpisode(CommentEpisode comment) {
    if (state is LoadLoadCommentEpisodeCubitReadyState) {
      final list = (state as LoadLoadCommentEpisodeCubitReadyState).items;

      animeService.deleteCommentEpisode(commentId: comment.id).then((_) {
        emit(LoadLoadCommentEpisodeCubitReadyState(PaginatedList(
          items: List.from(list.items)..removeWhere((c) => c.id == comment.id),
          total: list.total - 1,
          page: list.page,
        )));
      }, onError: (error) {
        // emit(LoadCommentErrorState(error));
      });
    }
  }
}

typedef LoadCommentEpisodeState = AutoListState<CommentEpisode>;
typedef LoadLoadCommentEpisodeCubitReadyState
    = AutoListReadyState<CommentEpisode>;
