import 'package:flutter/material.dart'; 
import 'package:umai/activity/models/activity.dart';
import 'package:umai/activity/widgets/activity/anime/anime_add_viewed.dart';
import 'package:umai/activity/widgets/activity/anime/anime_add_watch.dart';
import 'package:umai/activity/widgets/activity/anime/episode_comment.dart';
import 'package:umai/activity/widgets/activity/anime/like_episode.dart';
import 'package:umai/activity/widgets/activity/post/comment_post.dart';
import 'package:umai/activity/widgets/activity/post/like_post.dart';
import 'package:umai/activity/widgets/activity/post/new_post_user.dart';
import 'package:umai/activity/widgets/activity/post/reported_post.dart';
import 'package:umai/activity/widgets/activity/quiz/created_quiz.dart';
import 'package:umai/activity/widgets/activity/quiz/participed_quiz.dart';
import 'package:umai/activity/widgets/activity/quiz/reported_quiz.dart';
import 'package:umai/activity/widgets/activity/user/user_add.dart';
import 'package:umai/activity/widgets/activity/user/user_blocked.dart';
import 'package:umai/animes/models/anime.dart';
import 'package:umai/animes/models/episode.dart';
import 'package:umai/common/models/comment.dart';
import 'package:umai/common/models/user.dart'; 
import 'package:umai/quiz/models/quiz.dart'; 
import 'package:umai/social/models/post.dart'; 

class ActivityWidget extends StatelessWidget {
  final Activity activity;

  const ActivityWidget({required this.activity});
  @override
  Widget build(BuildContext context) {
    final child = switch (activity.targetEntity) {
      TargetEntity.animesVieweds => AnimeAddViewedWidget.get(
          targetEntity: activity.targetEntity,
          user: activity.user,
          context: context,
          anime: Anime.fromJson(activity.target)),
      TargetEntity.watchlists => AnimeAddWatchedWidget.get(
          targetEntity: activity.targetEntity,
          user: activity.user,
          context: context,
          anime: Anime.fromJson(activity.target)),
      TargetEntity.episodeLikes => LikeEpisodeWidget.get(
          targetEntity: activity.targetEntity,
          user: activity.user,
          context: context,
          episode: activity.target == null
              ? null
              : Episode.fromJson(activity.target)),
      TargetEntity.postLikes => LikePostWidget.get(
          targetEntity: activity.targetEntity,
          user: activity.user,
          context: context,
          post:
              activity.target == null ? null : Post.fromJson(activity.target)),
      TargetEntity.posts => NewPostUserWidget.get(
          targetEntity: activity.targetEntity,
          context: context,
          post: Post.fromJson(activity.target)),
      TargetEntity.postReports => ReportedPostWidget.get(
          targetEntity: activity.targetEntity,
          context: context,
          post: Post.fromJson(activity.target)),
      TargetEntity.quizzes => CreatedQuizWidget.get(
          targetEntity: activity.targetEntity,
          context: context,
          quiz: Quiz.fromJson(activity.target)),
      TargetEntity.participations => ParticipedQuizWidget.get(
          targetEntity: activity.targetEntity,
          user: activity.user,
          context: context,
          quiz: Quiz.fromJson(activity.target)),
      TargetEntity.quizReports => ReportedQuizWidget.get(
          targetEntity: activity.targetEntity,
          context: context,
          quiz: Quiz.fromJson(activity.target)),
      TargetEntity.follows => UserAddWidget.get(
          targetEntity: activity.targetEntity,
          context: context,
          user: activity.user,
          targetUser: User.fromJson(activity.target),
        ),
      TargetEntity.userBlocked => UserBlockedWidget.get(
          context: context, user: User.fromJson(activity.target)),
      TargetEntity.postComments => CommentPostWidget.get(
          targetEntity: activity.targetEntity,
          context: context,
          post: activity.subTarget == null
              ? null
              : Post.fromJson(activity.subTarget),
          comment: Comment.fromJson(activity.target)),
      TargetEntity.episodeComments => EpisodeCommentWidget.get(
          targetEntity: activity.targetEntity,
          context: context,
          episode: activity.subTarget == null
              ? null
              : Episode.fromJson(activity.subTarget),
          comment: Comment.fromJson(activity.target)),
      _ => const SizedBox.shrink(),
    };

    return child;
  }
}
