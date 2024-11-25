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

  ActivitieWidget({required this.activitie});

  @override
  Widget build(BuildContext context) {
    switch (activitie.targetEntity) {
      case TargetEntity.animesVieweds:
        return AnimeAddViewedWidget.get(
            user: activitie.user,
            context: context,
            anime: Anime.fromJson(activitie.target));
      case TargetEntity.watchlists:
        return AnimeAddWatchedWidget.get(
            user: activitie.user,
            context: context,
            anime: Anime.fromJson(activitie.target));
      case TargetEntity.episodeLikes:
        return LikeEpisodeWidget.get(
            user: activitie.user,
            context: context,
            episode: Episode.fromJson(activitie.target));
      case TargetEntity.postLikes:
        return LikePostWidget.get(
            user: activitie.user,
            context: context,
            post: Post.fromJson(activitie.target));
      case TargetEntity.posts:
        return NewPostUserWidget.get(
            context: context, post: Post.fromJson(activitie.target));
      case TargetEntity.postReports:
        return ReportedPostWidget.get(
            context: context, post: Post.fromJson(activitie.target));
      case TargetEntity.quizzes:
        return CreatedQuizWidget.get(
            context: context, quiz: Quiz.fromJson(activitie.target));
      case TargetEntity.participations:
        return ParticipedQuizWidget.get(
            user: activitie.user,
            context: context,
            quiz: Quiz.fromJson(activitie.target));
      case TargetEntity.quizReports:
        return ReportedQuizWidget.get(
            context: context, quiz: Quiz.fromJson(activitie.target));
      case TargetEntity.follows:
        return UserAddWidget.get(
            context: context, user: User.fromJson(activitie.target));
      case TargetEntity.userBlocked:
        return UserBlockedWidget.get(
            context: context, user: User.fromJson(activitie.target));
      case TargetEntity.postComments:
        final post = Post.fromJson(activitie.subTarget);
        final comment = Comment.fromJson(activitie.target);
        return CommentPostWidget.get(
            context: context, post: post, comment: comment);
      case TargetEntity.episodeComments:
        final episode = Episode.fromJson(activitie.subTarget);
        final comment = Comment.fromJson(activitie.target);
        return EpisodeCommentWidget.get(
            context: context, episode: episode, comment: comment);

      default:
        return Container();
    }
  }
}
