import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:umai/animes/models/anime.dart';
import 'package:umai/animes/models/episode.dart';
import 'package:umai/animes/services/anime_cubit_manager.dart';
import 'package:umai/animes/services/episode_cubit_manager.dart';
import 'package:umai/common/models/notification.dart';
import 'package:umai/common/models/user.dart';
import 'package:umai/common/services/link_service.dart';
import 'package:umai/common/services/person_cubit_manager.dart';
import 'package:umai/quiz/models/quiz.dart';
import 'package:umai/quiz/services/quiz_cubit_manager.dart';
import 'package:umai/social/models/post.dart';
import 'package:umai/social/services/post_cubit_manager.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  final QuizManageCubitManager quizCubitManager;
  final EpisodeCubitManager episodeCubitManager;
  final AnimeCubitManager animeCubitManager;
  final PostCubitManager postCubitManager;
  final PersonCubitManager personCubitManager;

  final LinkService linkService;
  NotificationCubit(
      this.linkService,
      this.quizCubitManager,
      this.personCubitManager,
      this.animeCubitManager,
      this.episodeCubitManager,
      this.postCubitManager)
      : super(const NotificationInitial());

  Future<void> onNotification({required Notification notification}) async {
    final id = notification.target.isNotEmpty ? notification.target : '';
    switch (notification.type) {
      case NotificationType.follows:
        if (id.isNotEmpty) {
          await fetchUserById(id: id);
        } else {
          emit(NotificationError("ID manquant pour l'utilisateur"));
        }
        break;
      case NotificationType.participations:
        if (id.isNotEmpty) {
          await fetchQuiz(id: id);
        } else {
          emit(NotificationError("ID manquant pour le quiz"));
        }
        break;
      case NotificationType.postLikes:
      case NotificationType.postComments:
      case NotificationType.postCommentLikes:
        if (id.isNotEmpty) {
          await fetchPost(id: id);
        } else {
          emit(NotificationError("ID manquant pour le post"));
        }
        break;

      case NotificationType.episodeComments:
      case NotificationType.episodeCommentLikes:
        if (id.isNotEmpty) {
          await fetchEpisode(id: id);
        } else {
          emit(NotificationError("ID manquant pour l'épisode"));
        }
        break;

      default:
        emit(const NotificationInitial());
    }
  }


  fetchUserById({required String id}) async {
    final stateBefore = state;

    emit(NotificationLoading());
    linkService.getUserById(id: id).then((data) {
      personCubitManager.add(data);
      emit(UserNotificationLoaded(data));
      emit(stateBefore);
    }, onError: (error, trace) {
      emit(NotificationError(error, trace));
      emit(stateBefore);
    });
  }

  fetchPost({required String id}) async {
    final stateBefore = state;

    emit(NotificationLoading());

    linkService.getPost(idPost: id).then((data) {
      postCubitManager.add(data);
      personCubitManager.add(data.user);
      emit(PostNotificationLoaded(data));
      emit(stateBefore);
    }, onError: (error, trace) {
      emit(NotificationError(error, trace));
      emit(stateBefore);
    });
  }

  fetchAnime({required String id}) async {
    final stateBefore = state;

    emit(NotificationLoading());
    linkService.getAnime(idAnime: id).then((data) {
      animeCubitManager.add(data);
      emit(AnimeNotificationLoaded(data));
      emit(stateBefore);
    }, onError: (error, trace) {
      emit(NotificationError(error, trace));
      emit(stateBefore);
    });
  }

  fetchEpisode({required String id}) async {
    final stateBefore = state;

    emit(NotificationLoading());
    linkService.getEpisode(idEpisode: id).then((data) {
      episodeCubitManager.add(data);
      emit(EpisodeNotificationLoaded(data));
      emit(stateBefore);
    }, onError: (error, trace) {
      emit(NotificationError(error, trace));
      emit(stateBefore);
    });
  }

  fetchQuiz({required String id}) async {
    final stateBefore = state;

    emit(NotificationLoading());
    linkService.getQuiz(idQuiz: id).then((data) {
      quizCubitManager.add(data);
      personCubitManager.add(data.user);
      emit(QuizNotificationLoaded(data));
      emit(stateBefore);
    }, onError: (error, trace) {
      emit(NotificationError(error, trace));
      emit(stateBefore);
    });
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
