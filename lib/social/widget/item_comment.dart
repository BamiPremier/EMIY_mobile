import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:potatoes/auto_list/bloc/auto_list_cubit.dart';
import 'package:potatoes/auto_list/widgets/auto_list_view.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/auth/bloc/auth_cubit.dart';
import 'package:umai/common/bloc/follow_cubit.dart';
import 'package:umai/common/bloc/user_cubit.dart';
import 'package:umai/common/widgets/image_profil.dart';
import 'package:umai/social/cubit/comment_manip_cubit.dart';
import 'package:umai/social/cubit/post_manip_cubit.dart';
import 'package:umai/social/model/comment.dart';
import 'package:umai/social/model/post.dart';
import 'package:umai/social/screens/post_details.dart';
import 'package:umai/social/services/social_service.dart';
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/themes.dart';

class ItemComment extends StatelessWidget {
  final VoidCallback actionFocus;

  const ItemComment._({required this.actionFocus});

  static Widget get({
    required BuildContext context,
    required Comment comment,
    required VoidCallback actionFocus,
  }) {
    return BlocProvider(
      create: (context) => CommentManipCubit(context.read(), comment),
      child: ItemComment._(actionFocus: actionFocus),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommentManipCubit, CommentManipState>(
        builder: (context, state) {
      final commentCubit = context.read<CommentManipCubit>();
      final comment = commentCubit.comment!;
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
            side: BorderSide(color: AppTheme.grey, width: 0.3),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                contentPadding: const EdgeInsets.only(top: 8.0)
                    .add(const EdgeInsets.symmetric(horizontal: 16.0)),
                leading: ImageProfil(
                  image: comment.user.image ?? '',
                  height: 40,
                  width: 40,
                ),
                title: Text(comment.user.username),
                subtitle: null,
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Il y a 18h',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: AppTheme.grey,
                          ),
                    ),
                    const SizedBox(width: 8),
                    PopupMenuButton<String>(
                      onSelected: (value) {
                        // Gérer les options de chaque commentaire
                      },
                      padding: EdgeInsets.zero,
                      itemBuilder: (BuildContext context) {
                        return ['Copier', 'Signaler', 'Supprimer']
                            .map((String choice) {
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
                child: Text(comment.content),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      comment.hasLiked
                          ? TextButton(
                              onPressed: () => commentCubit.unLikeComment(),
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .copyWith(
                                      color: AppTheme.primaryRed,
                                    ),
                              ),
                              child: Text(
                                'J\'aime',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .copyWith(
                                      color: AppTheme.primaryRed,
                                    ),
                              ),
                            )
                          : TextButton(
                              onPressed: () => commentCubit.likeComment(),
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                              ),
                              child: Text('J\'aime',
                                  style:
                                      Theme.of(context).textTheme.labelSmall!),
                            ),
                      TextButton(
                        onPressed: actionFocus,
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          textStyle: Theme.of(context).textTheme.labelSmall,
                        ),
                        child: const Text('répondre'),
                      )
                    ]),
                    if (comment.commentResponsesCount != 0)
                      TextButton(
                        onPressed: () {
                          commentCubit.seeResponse();
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          textStyle: Theme.of(context).textTheme.labelSmall,
                        ),
                        child: Text((state is SeeCommentResponsState)
                            ? 'voir moins'
                            : 'voir ${comment.commentResponsesCount} réponses'),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
        if (state is SeeCommentResponsState)
          AutoListView.get<Comment>(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            cubit: AutoListCubit(
                provider: ({int page = 1}) => context
                    .read<SocialService>()
                    .getComments(idPost: comment.id, page: page)),
            itemBuilder: (context, comment) => ItemComment.get(
              context: context,
              comment: comment,
              actionFocus: actionFocus,
            ),
            errorBuilder: (context, retry) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("Une erreur est survenue"),
                TextButton(
                  onPressed: retry,
                  child: const Text("Réessayer"),
                )
              ],
            ),
          )
      ]);
    });
  }
}
