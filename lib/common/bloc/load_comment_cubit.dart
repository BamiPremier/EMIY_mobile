import 'package:potatoes/auto_list/bloc/auto_list_cubit.dart';
import 'package:potatoes/auto_list/models/paginated_list.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/animes/bloc/load_episode_anime_cubit.dart';
import 'package:umai/animes/models/episode.dart';
import 'package:umai/animes/services/episode_service.dart';
import 'package:umai/common/bloc/common_cubit.dart';
import 'package:umai/common/services/person_cubit_manager.dart';
import 'package:umai/common/models/comment.dart';
import 'package:umai/social/models/post.dart';
import 'package:umai/social/services/social_service.dart';

class BaseLoadCommentCubit<T> extends AutoListCubit<Comment> {
  final PersonCubitManager personCubitManager;
  final XService<T> service;

  BaseLoadCommentCubit(
      this.service, String idItem, String target, this.personCubitManager)
      : super(provider: ({int page = 1}) async {
          return await service.getComments(
              idItem: idItem, target: target, page: page);
        });

  @override
  void onChange(Change<AutoListState<Comment>> change) {
    super.onChange(change);
    if (change.nextState is AutoListReadyState<Comment>) {
      for (var comment
          in (change.nextState as AutoListReadyState<Comment>).items.items) {
        personCubitManager.add(comment.user);
      }
    }
  }

  void putFirst(Comment comment) {
    if (state is AutoListReadyState<Comment>) {
      final list = (state as AutoListReadyState<Comment>).items;
      emit(AutoListReadyState(list.prepend(others: [comment])));
    }
  }

  deleteComment(Comment comment) {
    if (state is AutoListReadyState<Comment>) {
      final list = (state as AutoListReadyState<Comment>).items;
      service.deleteComment(commentId: comment.id).then((_) {
        emit(AutoListReadyState(PaginatedList(
          items: List.from(list.items)..removeWhere((c) => c.id == comment.id),
          total: list.total - 1,
          page: list.page,
        )));
      });
    }
  }
}

class LoadCommentCubit extends BaseLoadCommentCubit<Post> {
  final SocialService socialService;

  LoadCommentCubit(this.socialService, String idPost, String target,
      PersonCubitManager personCubitManager)
      : super(socialService, idPost, target, personCubitManager);
}

class LoadCommentEpisodeCubit extends BaseLoadCommentCubit<Episode> {
  final EpisodeService episodeService;
  final LoadEpisodeAnimeCubit? loadEpisodeAnimeCubit;
  final int idEpisode;
  final String target;

  LoadCommentEpisodeCubit(this.episodeService, this.idEpisode, this.target,
      this.loadEpisodeAnimeCubit, PersonCubitManager personCubitManager)
      : super(episodeService, idEpisode.toString(), target, personCubitManager);

  @override
  void deleteComment(Comment comment) {
    super.deleteComment(comment).then((_) {
      if (loadEpisodeAnimeCubit != null) {
        loadEpisodeAnimeCubit!
            .updateCommentCount(idEpisode: idEpisode, isIncrement: false);
      }
    });
  }
}

typedef LoadCommentState = AutoListState<Comment>;
typedef LoadCommentReadyState = AutoListReadyState<Comment>;
