import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:umai/animes/models/anime.dart';
import 'package:umai/animes/models/episode.dart';
import 'package:umai/animes/services/anime_cubit_manager.dart';
import 'package:umai/animes/services/episode_cubit_manager.dart';
import 'package:umai/common/models/user.dart';
import 'package:umai/common/services/link_service.dart';
import 'package:umai/common/services/person_cubit_manager.dart';
import 'package:umai/quiz/models/quiz.dart';
import 'package:umai/quiz/services/quiz_cubit_manager.dart';
import 'package:umai/social/models/post.dart';
import 'package:umai/social/services/post_cubit_manager.dart';

part 'link_state.dart';

class LinkCubit extends Cubit<LinkState> {
  late AppLinks _appLinks;

  final QuizManageCubitManager quizCubitManager;
  final EpisodeCubitManager episodeCubitManager;
  final AnimeCubitManager animeCubitManager;
  final PostCubitManager postCubitManager;
  final PersonCubitManager personCubitManager;

  StreamSubscription<Uri>? _linkSubscription;
  final LinkService linkService;
  LinkCubit(this.linkService, this.quizCubitManager, this.personCubitManager,
      this.animeCubitManager, this.episodeCubitManager, this.postCubitManager)
      : super(const LinkInitial()) {
    _initialize();
  }

  void _initialize() async {
    _appLinks = AppLinks();
    initDeepLinks();
  }

  Future<void> initDeepLinks() async {
    _linkSubscription = _appLinks.uriLinkStream.listen((Uri? uri) {
      if (uri != null) {
        _handleUri(uri);
      }
    });
  }

  Future<void> _handleUri(Uri uri) async {
    final id = uri.pathSegments.last.isNotEmpty ? uri.pathSegments.last : '';
    switch (uri.pathSegments.first) {
      case 'u':
        if (id.isNotEmpty) {
          await fetchUser(usertag: id);
        } else {
          emit(LinkError("ID manquant pour le post"));
        }
        break;
      case 'social':
        if (id.isNotEmpty) {
          await fetchPost(id: id);
        } else {
          emit(LinkError("ID manquant pour le post"));
        }
        break;
      case 'anime':
        if (id.isNotEmpty) {
          await fetchAnime(id: id);
        } else {
          emit(LinkError("ID manquant pour l'anime"));
        }
        break;
      case 'episode':
        if (id.isNotEmpty) {
          await fetchEpisode(id: id);
        } else {
          emit(LinkError("ID manquant pour l'anime"));
        }
        break;

      case 'quiz':
        if (id.isNotEmpty) {
          await fetchQuiz(id: id);
        } else {
          emit(LinkError("ID manquant pour le quiz"));
        }
        break;
      default:
        emit(const LinkInitial());
    }
  }

  fetchUser({required String usertag}) async {
    final stateBefore = state;

    emit(LinkLoading());
    linkService.getUserByUsertag(usertag: usertag).then((data) {
      personCubitManager.add(data);
      emit(UserLinkLoaded(data));
      emit(stateBefore);
    }, onError: (error, trace) {
      emit(LinkError(error, trace));
      emit(stateBefore);
    });
  }

  fetchPost({required String id}) async {
    final stateBefore = state;

    emit(LinkLoading());

    linkService.getPost(idPost: id).then((data) {
      postCubitManager.add(data);
      personCubitManager.add(data.user);
      emit(PostLinkLoaded(data));
      emit(stateBefore);
    }, onError: (error, trace) {
      emit(LinkError(error, trace));
      emit(stateBefore);
    });
  }

  fetchAnime({required String id}) async {
    final stateBefore = state;

    emit(LinkLoading());
    linkService.getAnime(idAnime: id).then((data) {
      animeCubitManager.add(data);
      emit(AnimeLinkLoaded(data));
      emit(stateBefore);
    }, onError: (error, trace) {
      emit(LinkError(error, trace));
      emit(stateBefore);
    });
  }

  fetchEpisode({required String id}) async {
    final stateBefore = state;

    emit(LinkLoading());
    linkService.getEpisode(idEpisode: id).then((data) {
      episodeCubitManager.add(data);
      emit(EpisodeLinkLoaded(data));
      emit(stateBefore);
    }, onError: (error, trace) {
      emit(LinkError(error, trace));
      emit(stateBefore);
    });
  }

  fetchQuiz({required String id}) async {
    final stateBefore = state;

    emit(LinkLoading());
    linkService.getQuiz(idQuiz: id).then((data) {
      quizCubitManager.add(data);
      personCubitManager.add(data.user);
      emit(QuizLinkLoaded(data));
      emit(stateBefore);
    }, onError: (error, trace) {
      emit(LinkError(error, trace));
      emit(stateBefore);
    });
  }

  @override
  Future<void> close() {
    _linkSubscription?.cancel();
    return super.close();
  }
}
