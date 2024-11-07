import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:potatoes/auto_list/widgets/auto_list_view.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/animes/bloc/comment_episode_cubit.dart';
import 'package:umai/animes/bloc/load_comment_episode_cubit.dart';
import 'package:umai/animes/models/comment_episode.dart';
import 'package:umai/animes/widgets/action_comment_response.dart';
import 'package:umai/animes/widgets/item_comment_episode.dart';
import 'package:umai/common/bloc/user_cubit.dart';
import 'package:umai/common/widgets/profile_picture.dart';
import 'package:umai/account/screens/person_account.dart';

import 'package:umai/utils/dialogs.dart';
import 'package:umai/utils/themes.dart';
import 'package:umai/utils/time_elapsed.dart';

class ItemCommentEpisodeResponse extends StatefulWidget {
  final int idEpisode;
  static Widget get({
    required BuildContext context,
    required int idEpisode,
    required CommentEpisode commentepisode,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                CommentEpisodeCubit(context.read(), commentepisode)),
      ],
      child: ItemCommentEpisodeResponse._(idEpisode: idEpisode),
    );
  }

  const ItemCommentEpisodeResponse._({
    required this.idEpisode,
  });
  @override
  State<ItemCommentEpisodeResponse> createState() =>
      _ItemCommentEpisodeResponseState();
}

class _ItemCommentEpisodeResponseState
    extends State<ItemCommentEpisodeResponse> {
  late final commentepisodeCubit = context.read<CommentEpisodeCubit>();
  late final loadCommentEpisodeCubit = LoadCommentEpisodeCubit(
    context.read(),
    widget.idEpisode,
    commentepisode.id,
    context.read(),
    context.read(),
  );
  late final commentepisode = commentepisodeCubit.comment;

  @override
  void dispose() {
    // loadCommentEpisodeCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommentEpisodeCubit, CommentEpisodeState>(
        builder: (context, state) {
      return BlocBuilder<LoadCommentEpisodeCubit, LoadCommentEpisodeState>(
          builder: (context, stateL) {
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                contentPadding: const EdgeInsets.only(top: 8.0, left: 8.0),
                leading: SizedBox(
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                    const Icon(
                      Icons.subdirectory_arrow_right,
                      color: Color(0xFF5F6368),
                      size: 24,
                    ),
                    GestureDetector(
                        child: ProfilePicture(
                          image: commentepisode.user.image,
                          height: 32,
                          width: 32,
                        ),
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => PersonAccountScreen.get(
                                    context: context,
                                    user: commentepisode.user))))
                  ]),
                ),
                title: Text(
                  commentepisode.user.username,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                subtitle: null,
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      commentepisode.createdAt.elapsed(),
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color: AppTheme.disabledText,
                          ),
                    ),
                    const SizedBox(width: 8),
                    PopupMenuButton<String>(
                      onSelected: (value) {
                        if (value == 'Signaler') {
                          reportCommentEpisode(context: context);
                        } else if (value == 'Supprimer') {
                          context
                              .read<LoadCommentEpisodeCubit>()
                              .deleteCommentEpisode(commentepisode);
                        } else if (value == 'Copier') {
                          Clipboard.setData(
                                  ClipboardData(text: commentepisode.content))
                              .then((_) {
                            showSuccessToast(
                                context: context,
                                content:
                                    'CommentEpisodeaire copié dans le presse-papiers');
                          });
                        }
                      },
                      padding: EdgeInsets.zero,
                      itemBuilder: (BuildContext context) {
                        List<String> options = ['Copier'];

                        if (commentepisode.user.id ==
                            context.read<UserCubit>().user.id) {
                          options.add('Supprimer');
                        } else {
                          options.add('Signaler');
                        }
                        return options.map((String choice) {
                          return PopupMenuItem<String>(
                            padding:
                                const EdgeInsets.only(right: 48.0, left: 16.0),
                            textStyle: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface),
                            value: choice,
                            child: Text(choice),
                          );
                        }).toList();
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(
                  commentepisode.content,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              const ActionCommentEpisodeResponse()
            ],
          ),
          if (state is SeeCommentEpisodeResponseState)
            AutoListView.get<CommentEpisode>(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              cubit: loadCommentEpisodeCubit,
              itemBuilder: (context, commentepisode) =>
                  ItemCommentEpisodeResponse.get(
                      context: context,
                      commentepisode: commentepisode,
                      idEpisode: widget.idEpisode),
              loadingBuilder: (context) => Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(16),
                  child: LinearProgressIndicator(
                    color: Theme.of(context).colorScheme.onTertiaryContainer,
                    backgroundColor:
                        Theme.of(context).colorScheme.tertiaryContainer,
                    borderRadius: BorderRadius.circular(30),
                  )),
              loadingMoreBuilder: (context) => Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(16),
                  child: LinearProgressIndicator(
                    color: Theme.of(context).colorScheme.onTertiaryContainer,
                    backgroundColor:
                        Theme.of(context).colorScheme.tertiaryContainer,
                    borderRadius: BorderRadius.circular(30),
                  )),
              errorBuilder: (context, retry) => Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("Une erreur est survenue"),
                    TextButton(
                      onPressed: retry,
                      child: const Text("Réessayer"),
                    )
                  ],
                ),
              ),
            ),
        ]);
      });
    });
  }
}
