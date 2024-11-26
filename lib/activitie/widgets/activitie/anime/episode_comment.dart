import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:readmore/readmore.dart';
import 'package:umai/account/screens/person_account.dart';
import 'package:umai/activitie/widgets/activitie/actu_btn_type1.dart';
import 'package:umai/activitie/widgets/activitie/actu_btn_type3.dart';
import 'package:umai/activitie/widgets/activitie/actu_head.dart';
import 'package:umai/activitie/widgets/activitie/post/post_actu_image.dart';
import 'package:umai/animes/bloc/episode_cubit.dart';
import 'package:umai/animes/models/episode.dart';
import 'package:umai/animes/services/episode_cubit_manager.dart';
import 'package:umai/common/bloc/action_comment_cubit.dart';
import 'package:umai/common/bloc/common_cubit.dart';
import 'package:umai/common/bloc/person_cubit.dart';
import 'package:umai/common/bloc/user_cubit.dart';
import 'package:umai/common/models/comment.dart';
import 'package:umai/common/services/cache_manager.dart';
import 'package:umai/common/services/person_cubit_manager.dart';
import 'package:umai/common/services/report_util_service.dart';
import 'package:umai/common/widgets/bottom_sheet.dart';
import 'package:umai/common/widgets/buttons.dart';
import 'package:umai/common/widgets/profile_picture.dart';
import 'package:umai/social/bloc/post_cubit.dart';
import 'package:umai/social/models/post.dart';
import 'package:umai/social/services/post_cubit_manager.dart';
import 'package:umai/social/services/social_service.dart';
import 'package:umai/social/widgets/post_image.dart';
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/svg_utils.dart';
import 'package:umai/utils/themes.dart';
import 'package:umai/utils/time_elapsed.dart';

class EpisodeCommentWidget extends StatefulWidget {
  final Episode? episode;
  final Comment comment;
  final String targetEntity;

  const EpisodeCommentWidget.forNoEpisode({
    required this.comment,
    required this.targetEntity,
  }) : episode = null;

  const EpisodeCommentWidget.forEpisode({
    required this.episode,
    required this.comment,
    required this.targetEntity,
  });

  static Widget get({
    required BuildContext context,
    Episode? episode,
    required Comment comment,
    required dynamic targetEntity,
  }) {
    return (episode == null)
        ? EpisodeCommentWidget.forNoEpisode(
            comment: comment, targetEntity: targetEntity)
        : MultiBlocProvider(
            providers: [
              BlocProvider<XCommonCubit<Episode>>(
                create: (context) => context.read<EpisodeCubit>(),
              ),
              BlocProvider(
                  create: (context) => ActionCommentEpisodeCubit(
                        context.read<XCommonCubit<Episode>>() as EpisodeCubit,
                      ) as ActionCommentBaseCubit<XCommonCubit<Episode>>),
              BlocProvider.value(
                value: context.read<EpisodeCubitManager>().get(episode),
              ),
            ],
            child: EpisodeCommentWidget.forEpisode(
              episode: episode,
              comment: comment,
              targetEntity: targetEntity,
            ),
          );
  }

  @override
  State<EpisodeCommentWidget> createState() => _EpisodeCommentWidgetState();
}

class _EpisodeCommentWidgetState extends State<EpisodeCommentWidget> {
  final isCollapsed = ValueNotifier<bool>(true);
  final _trimMode = TrimMode.Line;

  @override
  Widget build(BuildContext context) {
    return (widget.episode == null)
        ? buildNoEpisode()
        : buildEpisode(widget.episode!);
  }

  Widget buildNoEpisode() {
    return Container(
        margin: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ActuHeadWidget.get(
                targetEntity: widget.targetEntity,
                context: context,
                user: widget.comment.user),
            Container(
                padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                child: AnimatedSize(
                    duration: const Duration(milliseconds: 300),
                    alignment: Alignment.topCenter,
                    curve: Curves.easeInOut,
                    child: ReadMoreText(
                      widget.comment!.content,
                      trimMode: _trimMode,
                      trimLines: 3,
                      isCollapsed: isCollapsed,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                      colorClickableText: Theme.of(context).primaryColor,
                      trimCollapsedText: 'Lire plus',
                      trimExpandedText: ' moins',
                    ))),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onInverseSurface,
                        borderRadius: BorderRadius.circular(8)),
                    child: Text(
                      "Le contenu n’est plus disponible",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }

  Widget buildEpisode(Episode episode) {
    return BlocConsumer<EpisodeCubit, XCommonState>(
        listener: (context, state) {},
        builder: (context, state) {
          Episode episode = context.read<EpisodeCubit>().x as Episode;
          return Container(
              margin: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ActuHeadWidget.get(
                      targetEntity: widget.targetEntity,
                      context: context,
                      user: widget.comment.user),
                  Container(
                      padding: const EdgeInsets.all(8),
                      child: AnimatedSize(
                          duration: const Duration(milliseconds: 300),
                          alignment: Alignment.topCenter,
                          curve: Curves.easeInOut,
                          child: ReadMoreText(
                            widget.comment.content,
                            trimMode: _trimMode,
                            trimLines: 3,
                            isCollapsed: isCollapsed,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
                                ),
                            colorClickableText: Theme.of(context).primaryColor,
                            trimCollapsedText: 'Lire plus',
                            trimExpandedText: ' moins',
                          ))),
                  const SizedBox(height: 8),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(8)
                          .add(const EdgeInsets.only(left: 8)),
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.onInverseSurface,
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image(
                              image: context
                                  .read<AppCacheManager>()
                                  .getAnimeImage(episode.anime),
                              width: 72,
                              height: 88,
                              fit: BoxFit.cover,
                              frameBuilder: (context, child, frame,
                                  wasSynchronouslyLoaded) {
                                if (frame != null) return child;
                                return Container(
                                  width: 72,
                                  height: 88,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .tertiaryContainer,
                                  child: wasSynchronouslyLoaded
                                      ? child
                                      : Center(
                                          child: SizedBox(
                                            height: 16.0,
                                            width: 16.0,
                                            child: CircularProgressIndicator(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onTertiaryContainer,
                                              strokeWidth: 2.0,
                                            ),
                                          ),
                                        ),
                                );
                              },
                              errorBuilder: (_, __, ___) => toSvgIcon(
                                icon: Assets.iconsError,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Mushoku Tensei",
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  "Jobless Reincarnation",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSurfaceVariant),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 9),
                                Text(
                                  "Épisode 23",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSurfaceVariant),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ActuBtnType3Widget<Episode, EpisodeCubit,
                      ActionCommentBaseCubit<EpisodeCubit>>(
                    actionCommentBaseCubit:
                        context.read<ActionCommentBaseCubit<EpisodeCubit>>(),
                  )
                ],
              ));
        });
  }
}
