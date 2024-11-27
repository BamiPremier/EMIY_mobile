import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:readmore/readmore.dart';
import 'package:umai/account/screens/person_account.dart';
import 'package:umai/activitie/models/activitie.dart';
import 'package:umai/common/bloc/person_cubit.dart';
import 'package:umai/common/bloc/user_cubit.dart';
import 'package:umai/common/models/user.dart';
import 'package:umai/common/services/person_cubit_manager.dart';
import 'package:umai/common/services/report_util_service.dart';
import 'package:umai/common/widgets/bottom_sheet.dart';
import 'package:umai/common/widgets/buttons.dart';
import 'package:umai/common/widgets/profile_picture.dart';
import 'package:umai/social/bloc/post_cubit.dart';
import 'package:umai/social/models/post.dart';
import 'package:umai/social/services/social_service.dart';
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/svg_utils.dart';
import 'package:umai/utils/themes.dart';
import 'package:umai/utils/time_elapsed.dart';

class ActuHeadWidget extends StatelessWidget {
  final String targetEntity;
  late final String action;

  static Widget get({
    required BuildContext context,
    required User user,
    required String targetEntity,
  }) {
    return BlocProvider.value(
      value: context.read<PersonCubitManager>().get(user),
      child: ActuHeadWidget._(targetEntity: targetEntity),
    );
  }

  ActuHeadWidget._({required this.targetEntity}) {
    action = buildActionText(targetEntity: targetEntity);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PersonCubit, PersonState>(
        listener: (context, state) {},
        builder: (context, state) {
          final personCubit = context.read<PersonCubit>();
          final user = personCubit.user;
          return Container(
            padding: const EdgeInsets.all(8).copyWith(top: 24),
            child: Row(
              children: <Widget>[
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    GestureDetector(
                      child: ProfilePicture(
                        image: user.imageFull ?? '',
                        size: 32.0,
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PersonAccountScreen.get(
                                context: context, user: user)));
                      },
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: buildActivitieIcon(
                          context: context, targetEntity: targetEntity),
                    ),
                  ],
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: GestureDetector(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: user.username,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          WidgetSpan(
                            child: Text(
                              " $action",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ],
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PersonAccountScreen.get(
                              context: context, user: user)));
                    },
                  ),
                ),
              ],
            ),
          );
        });
  }

  Widget buildActivitieIcon(
      {required BuildContext context, required String targetEntity}) {
    var iconData = {
      TargetEntity.posts: Assets.iconsNotification,
      TargetEntity.episodeLikes: Assets.iconsLike,
      TargetEntity.postLikes: Assets.iconsLike,
      TargetEntity.eventLikes: Assets.iconsLike,
      TargetEntity.episodeComments: Assets.iconsComment,
      TargetEntity.postComments: Assets.iconsComment,
      TargetEntity.follows: Assets.iconsFollower,
      TargetEntity.userBlocked: Assets.iconsBlocked,
      TargetEntity.animesVieweds: Assets.iconsTick,
      TargetEntity.watchlists: Assets.iconsBookmark,
      TargetEntity.participations: Assets.iconsQuiz,
      TargetEntity.quizzes: Assets.iconsQuiz,
      TargetEntity.postReports: Assets.iconsSignal,
      TargetEntity.quizReports: Assets.iconsSignal,
      TargetEntity.eventReports: Assets.iconsSignal,
    };

    return iconData.containsKey(targetEntity)
        ? Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onInverseSurface,
                shape: BoxShape.circle),
            height: 16,
            width: 16,
            padding: const EdgeInsets.all(3),
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: toSvgIcon(
                icon: iconData[targetEntity]!,
                size: 10,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              onPressed: () {},
            ),
          )
        : Container();
  }

  String buildActionText({
    required String targetEntity,
  }) {
    switch (targetEntity) {
      case TargetEntity.posts:
        return 'a publié';
      case TargetEntity.episodeLikes:
      case TargetEntity.postLikes:
      case TargetEntity.eventLikes:
        return 'a aimé';
      case TargetEntity.episodeComments:
      case TargetEntity.postComments:
        return 'a commenté';

      case TargetEntity.follows:
        return 'a ajouté';

      case TargetEntity.animesVieweds:
        return 'a vu';
      case TargetEntity.watchlists:
        return 'a ajouté à sa liste';
      case TargetEntity.quizzes:
        return 'a créé';
      case TargetEntity.participations:
        return 'a participé';

      default:
        return '';
    }
  }
}
