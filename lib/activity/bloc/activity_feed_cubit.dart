import 'package:potatoes/auto_list.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/activity/services/activity_service.dart';
import 'package:umai/animes/models/anime.dart';
import 'package:umai/animes/models/episode.dart';
import 'package:umai/animes/services/anime_cubit_manager.dart';
import 'package:umai/animes/services/episode_cubit_manager.dart';
import 'package:umai/common/models/user.dart';
import 'package:umai/common/services/person_cubit_manager.dart';
import 'package:umai/activity/models/activity.dart';
import 'package:umai/quiz/models/quiz.dart';
import 'package:umai/quiz/services/quiz_cubit_manager.dart';
import 'package:umai/social/models/post.dart';
import 'package:umai/social/services/post_cubit_manager.dart'; 

class ActivityFeedCubit extends AutoListCubit<Activity> {
  final ActivityService activitytService;
  final PersonCubitManager personCubitManager;
  final PostCubitManager postCubitManager;
  final AnimeCubitManager animeCubitManager;
  final QuizManageCubitManager quizCubitManager;
  final EpisodeCubitManager episodeCubitManager;
  ActivityFeedCubit(
    this.activitytService,
    this.postCubitManager,
    this.personCubitManager,
    this.animeCubitManager,
    this.quizCubitManager,
    this.episodeCubitManager,
  ) : super(provider: activitytService.getFeed);
  @override
  void onChange(Change<AutoListState<Activity>> change) {
    super.onChange(change);
    if (change.nextState is AutoListReadyState<Activity>) {
      for (var activity
          in (change.nextState as AutoListReadyState<Activity>).items.items) {
        personCubitManager.add(activity.user);
        switch (activity.targetEntity) {
          case TargetEntity.follows:
            personCubitManager.add(User.fromJson(activity.target));

          case TargetEntity.posts:
          case TargetEntity.postLikes:
          case TargetEntity.postReports:
            postCubitManager.add(Post.fromJson(activity.target));
          case TargetEntity.animesVieweds:
          case TargetEntity.watchlists:
          case TargetEntity.eventLikes:
            animeCubitManager.add(Anime.fromJson(activity.target));
          case TargetEntity.quizzes:
          case TargetEntity.participations:
          case TargetEntity.quizReports:
            quizCubitManager.add(Quiz.fromJson(activity.target));
          case TargetEntity.episodeComments:
            if (activity.subTarget != null) {
              episodeCubitManager.add(Episode.fromJson(activity.subTarget));
            }
          case TargetEntity.postComments:
            if (activity.subTarget != null) {
              postCubitManager.add(Post.fromJson(activity.subTarget));
            }
        }
      }
    }
  }
}
