import 'package:flutter/material.dart';
import 'package:potatoes/auto_list/widgets/auto_list_view.dart';
import 'package:umai/activitie/bloc/activitie_feed_cubit.dart';
import 'package:umai/activitie/models/activitie.dart';
import 'package:umai/activitie/widgets/activitie/anime/anime_add_viewed.dart';
import 'package:umai/activitie/widgets/activitie/anime/anime_add_watch.dart';
import 'package:umai/activitie/widgets/activitie/anime/episode_comment.dart';
import 'package:umai/activitie/widgets/activitie/anime/like_episode.dart';
import 'package:umai/activitie/widgets/activitie/post/comment_post.dart';
import 'package:umai/activitie/widgets/activitie/post/like_post.dart';
import 'package:umai/activitie/widgets/activitie/post/new_post_user.dart';
import 'package:umai/activitie/widgets/activitie/post/reported_post.dart';
import 'package:umai/activitie/widgets/activitie/quiz/created_quiz.dart';
import 'package:umai/activitie/widgets/activitie/quiz/participed_quiz.dart';
import 'package:umai/activitie/widgets/activitie/quiz/reported_quiz.dart';
import 'package:umai/activitie/widgets/activitie/user/user_add.dart';
import 'package:umai/activitie/widgets/activitie/user/user_blocked.dart';
import 'package:umai/animes/models/anime.dart';
import 'package:umai/animes/models/episode.dart';
import 'package:umai/common/models/comment.dart';
import 'package:umai/common/models/user.dart';
import 'package:umai/common/widgets/empty_builder.dart';
import 'package:umai/common/widgets/error_builder.dart';
import 'package:umai/quiz/models/quiz.dart';
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/svg_utils.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/social/bloc/post_feed_cubit.dart';
import 'package:umai/social/models/post.dart';
import 'package:umai/social/screens/new_post_screen.dart';
import 'package:umai/social/widgets/item_post.dart';
import 'package:umai/social/widgets/new_post_banner.dart';

class ActivitieWidget extends StatelessWidget {
  final Activitie activitie;

  const ActivitieWidget({required this.activitie});
  @override
  Widget build(BuildContext context) {
    final child = switch (activitie.targetEntity) {
      TargetEntity.animesVieweds => AnimeAddViewedWidget.get(
          targetEntity: activitie.targetEntity,
          user: activitie.user,
          context: context,
          anime: Anime.fromJson(activitie.target)),
      TargetEntity.watchlists => AnimeAddWatchedWidget.get(
          targetEntity: activitie.targetEntity,
          user: activitie.user,
          context: context,
          anime: Anime.fromJson(activitie.target)),
      TargetEntity.episodeLikes => LikeEpisodeWidget.get(
          targetEntity: activitie.targetEntity,
          user: activitie.user,
          context: context,
          episode: activitie.target == null
              ? null
              : Episode.fromJson(activitie.target)),
      TargetEntity.postLikes => LikePostWidget.get(
          targetEntity: activitie.targetEntity,
          user: activitie.user,
          context: context,
          post: activitie.target == null
              ? null
              : Post.fromJson(activitie.target)),
      TargetEntity.posts => NewPostUserWidget.get(
          targetEntity: activitie.targetEntity,
          context: context,
          post: Post.fromJson(activitie.target)),
      TargetEntity.postReports => ReportedPostWidget.get(
          targetEntity: activitie.targetEntity,
          context: context,
          post: Post.fromJson(activitie.target)),
      TargetEntity.quizzes => CreatedQuizWidget.get(
          targetEntity: activitie.targetEntity,
          context: context,
          quiz: Quiz.fromJson(activitie.target)),
      TargetEntity.participations => ParticipedQuizWidget.get(
          targetEntity: activitie.targetEntity,
          user: activitie.user,
          context: context,
          quiz: Quiz.fromJson(activitie.target)),
      TargetEntity.quizReports => ReportedQuizWidget.get(
          targetEntity: activitie.targetEntity,
          context: context,
          quiz: Quiz.fromJson(activitie.target)),
      TargetEntity.follows => UserAddWidget.get(
          targetEntity: activitie.targetEntity,
          context: context,
          user: activitie.user,
          targetUser: User.fromJson(activitie.target),
        ),
      TargetEntity.userBlocked => UserBlockedWidget.get(
          context: context, user: User.fromJson(activitie.target)),
      TargetEntity.postComments => CommentPostWidget.get(
          targetEntity: activitie.targetEntity,
          context: context,
          post: activitie.subTarget == null
              ? null
              : Post.fromJson(activitie.subTarget),
          comment: Comment.fromJson(activitie.target)),
      TargetEntity.episodeComments => EpisodeCommentWidget.get(
          targetEntity: activitie.targetEntity,
          context: context,
          episode: activitie.subTarget == null
              ? null
              : Episode.fromJson(activitie.subTarget),
          comment: Comment.fromJson(activitie.target)),
      _ => Container(child: Text(activitie.targetEntity)),
    };

    return Container(
      margin: const EdgeInsets.only(
        left: 8,
        right: 8,
      ),
      child: child,
    );
  }
}
