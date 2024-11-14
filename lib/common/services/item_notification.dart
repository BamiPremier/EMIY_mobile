import 'package:flutter/material.dart' hide Notification;
import 'package:potatoes/libs.dart';
import 'package:umai/common/models/notification.dart';
import 'package:potatoes/common/widgets/loaders.dart';
import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:umai/account/screens/account.dart';
import 'package:umai/account/screens/person_account.dart';
import 'package:umai/animes/bloc/load_episode_anime_cubit.dart';
import 'package:umai/animes/screens/anime_details.dart';
import 'package:umai/animes/screens/home.dart';
import 'package:umai/animes/widgets/episode_head.dart';
import 'package:umai/common/bloc/link_cubit.dart';
import 'package:umai/common/models/user.dart';
import 'package:umai/common/screens/common_details.dart';
import 'package:umai/common/widgets/profile_picture.dart';
import 'package:umai/quiz/screens/home.dart';
import 'package:umai/quiz/screens/quiz_details.dart';
import 'package:umai/social/screens/home.dart';
import 'package:umai/social/widgets/head_post.dart';
import 'package:umai/utils/themes.dart';

Future<void>? goAfterNotification(
    BuildContext context, Notification notification) {
  switch (notification.type) {
    case NotificationType.follows:
      return Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => PersonAccountScreen.get(
              context: context, user: notification.target as User)));
    case NotificationType.participations:
    //   return Navigator.of(context).push(MaterialPageRoute(
    //       builder: (context) => QuizDetailsScreen.get(
    //           context: context, quizId: notification.target as String)));
    // case NotificationType.postLikes:
    // case NotificationType.postComments:
    //   return Navigator.of(context).push(MaterialPageRoute(
    //       builder: (context) => PostDetailsScreen.get(
    //           context: context, postId: notification.target as String)));
    // case NotificationType.postCommentLikes:
    //   return Navigator.of(context).push(MaterialPageRoute(
    //       builder: (context) => PostDetailsScreen.get(
    //           context: context, postId: notification.target as String)));
    // case NotificationType.episodeComments:
    // case NotificationType.episodeCommentLikes:
    //   return Navigator.of(context).push(MaterialPageRoute(
    //       builder: (context) => EpisodeDetailsScreen.get(
    //           context: context, episodeId: notification.target as String)));
    default:
      return null;
  }
}
