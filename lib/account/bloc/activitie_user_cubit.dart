import 'package:potatoes/auto_list.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/activitie/services/activitie_service.dart';
import 'package:umai/animes/models/anime.dart';
import 'package:umai/animes/models/episode.dart';
import 'package:umai/animes/services/anime_cubit_manager.dart';
import 'package:umai/animes/services/episode_cubit_manager.dart';
import 'package:umai/common/models/user.dart';
import 'package:umai/common/services/person_cubit_manager.dart';
import 'package:umai/activitie/models/activitie.dart';
import 'package:umai/quiz/models/quiz.dart';
import 'package:umai/quiz/services/quiz_cubit_manager.dart';
import 'package:umai/social/models/post.dart';
import 'package:umai/social/services/post_cubit_manager.dart';
import 'package:umai/social/services/social_service.dart';

class ActivitieUserCubit extends AutoListCubit<Activitie> {
  final ActivitieService activitietService;
  final PersonCubitManager personCubitManager;
  final PostCubitManager postCubitManager;
  final AnimeCubitManager animeCubitManager;
  final QuizManageCubitManager quizCubitManager;
  final EpisodeCubitManager episodeCubitManager;
  final String? userId;

  ActivitieUserCubit(
    this.activitietService,
    this.postCubitManager,
    this.personCubitManager,
    this.animeCubitManager,
    this.quizCubitManager,
    this.episodeCubitManager,
    this.userId,
  ) : super(provider: ({page = 1}) =>
                activitietService.getUserActivitie(userId: userId));
  @override
  void onChange(Change<AutoListState<Activitie>> change) {
    super.onChange(change);
    if (change.nextState is AutoListReadyState<Activitie>) {
      for (var activitie
          in (change.nextState as AutoListReadyState<Activitie>).items.items) {
        personCubitManager.add(activitie.user);
        switch (activitie.targetEntity) {
          case TargetEntity.follows:
            personCubitManager.add(User.fromJson(activitie.target));

          case TargetEntity.posts:
          case TargetEntity.postLikes:
          case TargetEntity.postReports:
            postCubitManager.add(Post.fromJson(activitie.target));
          case TargetEntity.animesVieweds:
          case TargetEntity.watchlists:
          case TargetEntity.eventLikes:
            animeCubitManager.add(Anime.fromJson(activitie.target));
          case TargetEntity.quizzes:
          case TargetEntity.participations:
          case TargetEntity.quizReports:
            quizCubitManager.add(Quiz.fromJson(activitie.target));
          case TargetEntity.episodeComments:
            if (activitie.subTarget != null) {
              episodeCubitManager.add(Episode.fromJson(activitie.subTarget));
            }
          case TargetEntity.postComments:
            if (activitie.subTarget != null) {
              postCubitManager.add(Post.fromJson(activitie.subTarget));
            }
        }
      }
    }
  }
}
