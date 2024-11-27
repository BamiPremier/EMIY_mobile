import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:readmore/readmore.dart'; 
import 'package:umai/activity/widgets/activity/actu_btn_type3.dart';
import 'package:umai/activity/widgets/activity/actu_head.dart';
import 'package:umai/activity/widgets/activity/anime/episode_info.dart'; 
import 'package:umai/animes/bloc/episode_cubit.dart';
import 'package:umai/animes/models/episode.dart';
import 'package:umai/animes/services/episode_cubit_manager.dart';
import 'package:umai/animes/widgets/episode_head.dart';
import 'package:umai/common/bloc/action_comment_cubit.dart';
import 'package:umai/common/bloc/comment_cubit.dart';
import 'package:umai/common/bloc/common_cubit.dart'; 
import 'package:umai/common/models/comment.dart';
import 'package:umai/common/screens/common_details.dart'; 

class EpisodeCommentWidget extends StatefulWidget {
  final Episode? episode;
  final Comment comment;
  final String targetEntity;

  const EpisodeCommentWidget.forNoEpisode({super.key, 
    required this.comment,
    required this.targetEntity,
  }) : episode = null;

  const EpisodeCommentWidget.forEpisode({super.key, 
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
              BlocProvider.value(
                value: context.read<EpisodeCubitManager>().get(episode),
              ),
              BlocProvider<XCommonCubit<Episode>>(
                create: (context) =>
                    context.read<EpisodeCubit>() as XCommonCubit<Episode>,
              ),
              BlocProvider(
                  create: (context) =>
                      ActionCommentEpisodeCubit(context.read<EpisodeCubit>())
                          as ActionCommentBaseCubit<XCommonCubit<Episode>>),
              BlocProvider(
                create: (context) => CommentCubit<Episode>(
                  context.read<XService<Episode>>(),
                  comment,
                ),
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
    return Column(
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
                  widget.comment.content,
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
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildEpisode(Episode episode) {
    late final ActionCommentBaseCubit<XCommonCubit<Episode>>
        actionCommentCubit =
        context.read<ActionCommentBaseCubit<XCommonCubit<Episode>>>();
    return BlocConsumer<EpisodeCubit, XCommonState>(
        listener: (context, state) {},
        builder: (context, state) {
          Episode episode = context.read<EpisodeCubit>().x as Episode;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ActuHeadWidget.get(
                  targetEntity: widget.targetEntity,
                  context: context,
                  user: widget.comment.user),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: AnimatedSize(
                      duration: const Duration(milliseconds: 300),
                      alignment: Alignment.topCenter,
                      curve: Curves.easeInOut,
                      child: ReadMoreText(
                        widget.comment.content,
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
              SizedBox(
                height: 8,
              ),
              EpisodeInfo(),
              ActuBtnType3Widget<Episode, XCommonCubit<Episode>,
                      ActionCommentBaseCubit<XCommonCubit<Episode>>>(
                  actionCommentBaseCubit: actionCommentCubit,
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CommonDetailsScreen.fromEpisode(
                          context: context,
                          episode: episode,
                          head: (context) => EpisodeHead.get(
                                context: context,
                                episode: episode,
                              )))))
            ],
          );
        });
  }
}
