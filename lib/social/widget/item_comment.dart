import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:potatoes/auto_list/bloc/auto_list_cubit.dart';
import 'package:potatoes/auto_list/widgets/auto_list_view.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/auth/bloc/auth_cubit.dart';
import 'package:umai/common/bloc/person_cubit.dart';
import 'package:umai/common/bloc/user_cubit.dart';
import 'package:umai/common/widgets/image_profil.dart';
import 'package:umai/social/cubit/comment_cubit.dart';
import 'package:umai/social/cubit/load_comment_cubit.dart';
import 'package:umai/social/cubit/post_cubit.dart';
import 'package:umai/social/model/comment.dart';
import 'package:umai/social/model/post.dart';
import 'package:umai/social/screens/post_details.dart';
import 'package:umai/social/services/social_service.dart';
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/text_utils.dart';
import 'package:umai/utils/themes.dart';

class ItemComment extends StatelessWidget {
  final VoidCallback actionFocus;
  final String idPost;
  final bool isResponse;

  const ItemComment._(
      {required this.actionFocus,
      required this.idPost,
      this.isResponse = false});

  static Widget get({
    required BuildContext context,
    required Comment comment,
    required VoidCallback actionFocus,
    required String idPost,
    bool? isResponse = false,
  }) {
    return BlocProvider(
      create: (context) => CommentCubit(context.read(), comment),
      child: ItemComment._(
          actionFocus: actionFocus, idPost: idPost, isResponse: isResponse!),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommentCubit, CommentState>(builder: (context, state) {
      final commentCubit = context.read<CommentCubit>();
      final loadcommentCubit = context.read<LoadCommentCubit>();
      final comment = commentCubit.comment!;
      return BlocBuilder<LoadCommentCubit, LoadCommentState>(
          builder: (context, stateL) {
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
              side: BorderSide(
                  color: Theme.of(context).colorScheme.outlineVariant,
                  width: 0.5),
            ),
            color: AppTheme.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  contentPadding: const EdgeInsets.only(top: 8.0, left: 16.0),
                  leading: SizedBox(
                    width: isResponse ? 64 : 40,
                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                      if (isResponse)
                        const Icon(
                          Icons.subdirectory_arrow_right,
                          color: Color(0xFF5F6368),
                          size: 24,
                        ),
                      ImageProfil(
                        image: comment.user.image ?? '',
                        height: 40,
                        width: 40,
                      )
                    ]),
                  ),
                  title: Text(
                    TextUtils.capitalizeEachWord(comment.user.username),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  subtitle: null,
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Il y a 18h',
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  color: AppTheme.grey,
                                ),
                      ),
                      const SizedBox(width: 8),
                      PopupMenuButton<String>(
                        onSelected: (value) {
                          if (value == 'Signaler') {
                            commentCubit.signalerComment();
                          } else if (value == 'Supprimer') {
                            loadcommentCubit.deleteComment(comment);
                          } else if (value == 'Copier') {}
                        },
                        padding: EdgeInsets.zero,
                        itemBuilder: (BuildContext context) {
                          List<String> options = ['Copier', 'Signaler'];

                          if (comment.user.id ==
                              context.read<UserCubit>().user.id) {
                            options.add('Supprimer');
                          }
                          return options.map((String choice) {
                            return PopupMenuItem<String>(
                              padding: const EdgeInsets.only(
                                  right: 48.0, left: 16.0),
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
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Text(
                    comment.content,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
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
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall!),
                              ),
                        TextButton(
                          onPressed: () {
                            context
                                .read<LoadCommentCubit>()
                                .selectComment(comment);

                            actionFocus();
                          },
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
                          child: Text((state is SeeCommentResponseState)
                              ? 'voir moins'
                              : 'voir ${comment.commentResponsesCount} réponses'),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (state is SeeCommentResponseState)
            AutoListView.get<Comment>(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              cubit: AutoListCubit(
                  provider: ({int page = 1}) => context
                      .read<SocialService>()
                      .getComments(
                          target: comment.id, idPost: idPost, page: page)),
              itemBuilder: (context, comment) => ItemComment.get(
                  context: context,
                  comment: comment,
                  actionFocus: actionFocus,
                  idPost: idPost,
                  isResponse: true),
              loadingBuilder: (context) => Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(16),
                child: SizedBox(
                  height: 30,
                  width: 30,
                  child: CircularProgressIndicator(),
                ),
              ),
              errorBuilder: (context, retry) => Container(
                alignment: Alignment.center,
                // padding: EdgeInsets.all(16),
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
            )
        ]);
      });
    });
  }
}
