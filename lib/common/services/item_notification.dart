import 'package:flutter/material.dart' hide Notification;
import 'package:umai/account/screens/person_account.dart';
import 'package:umai/common/models/notification.dart';
import 'package:umai/common/models/user.dart';

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
